import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/fakes/fake_data_store.dart';
import '../../data/repositories/fake_auth_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_session_status_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'session_providers.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return FakeAuthRepository(ref, ref.watch(fakeDataStoreProvider));
}

@riverpod
LoginUseCase loginUseCase(Ref ref) => LoginUseCase(ref.watch(authRepositoryProvider));

@riverpod
RegisterUseCase registerUseCase(Ref ref) => RegisterUseCase(ref.watch(authRepositoryProvider));

@riverpod
LogoutUseCase logoutUseCase(Ref ref) => LogoutUseCase(ref.watch(authRepositoryProvider));

@riverpod
GetSessionStatusUseCase getSessionStatusUseCase(Ref ref) {
  return GetSessionStatusUseCase(ref.watch(sessionRepositoryProvider));
}