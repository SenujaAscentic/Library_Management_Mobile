import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_failure.dart';
import 'auth_providers.dart';

part 'login_controller.g.dart';

@Riverpod(keepAlive: true)
class LoginController extends _$LoginController {
  @override
  AsyncValue<void>? build() => null;

  Future<bool> submit({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
            () => ref.read(loginUseCaseProvider).call(email: email, password: password));
    return state?.hasError == false;
  }

  String? get errorMessage {
    if (state == null || !state!.hasError) return null;
    final error = state!.error;
    if (error is AuthException) {
      return error.failure.when(
        invalidCredentials: () => 'Incorrect email or password.',
        duplicateEmail: () => 'Something went wrong. Please try again.',
        sessionExpired: () => 'Your session has expired. Please log in again.',
        unknown: (_) => 'Something went wrong. Please try again.',
      );
    }
    return 'Something went wrong. Please try again.';
  }
}