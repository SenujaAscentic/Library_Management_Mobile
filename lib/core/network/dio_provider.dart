import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/token_storage.dart';
import 'token_refresh_service.dart';

part 'dio_provider.g.dart';

const _baseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: 'https://localhost:5001');

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(BaseOptions(baseUrl: _baseUrl));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          await ref.read(tokenRefreshServiceProvider).ensureFreshToken();
        } catch (_) {
          // Session dead — request proceeds tokenless, 401s naturally.
        }
        final session = await ref.read(tokenStorageProvider.future);
        if (session != null) {
          options.headers['Authorization'] = 'Bearer ${session.accessToken}';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        final is401 = error.response?.statusCode == 401 || error.response?.statusCode == 403;
        final alreadyRetried = error.requestOptions.extra['retried'] == true;
        if (is401 && !alreadyRetried) {
          try {
            await ref.read(tokenRefreshServiceProvider).ensureFreshToken();
            final retryOptions = error.requestOptions..extra['retried'] = true;
            final response = await dio.fetch(retryOptions);
            handler.resolve(response);
            return;
          } catch (_) {
            // Refresh failed — session already cleared above.
          }
        }
        handler.next(error);
      },
    ),
  );

  return dio;
}