import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_failure.dart';
import 'auth_providers.dart';

part 'register_controller.g.dart';

@Riverpod(keepAlive: true)
class RegisterController extends _$RegisterController {
  @override
  AsyncValue<void>? build() => null;

  Future<bool> submit({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(registerUseCaseProvider).call(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    ));
    return state?.hasError == false;
  }

  String? get bannerError {
    if (state == null || !state!.hasError) return null;
    final error = state!.error;
    if (error is AuthException) {
      return error.failure.when(
        invalidCredentials: () => null,
        duplicateEmail: () => 'This email is already registered.',
        sessionExpired: () => null,
        unknown: (_) => 'Something went wrong. Please try again.',
      );
    }
    return 'Something went wrong. Please try again.';
  }
}