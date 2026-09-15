import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/fakes/fake_data_store.dart';
import '../../../auth/presentation/providers/session_providers.dart';
import '../../data/repositories/fake_profile_repository.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_own_profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import 'profile_state.dart';

part 'profile_providers.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  return FakeProfileRepository(ref.watch(fakeDataStoreProvider));
}

@riverpod
GetOwnProfileUseCase getOwnProfileUseCase(Ref ref) {
  return GetOwnProfileUseCase(ref.watch(profileRepositoryProvider));
}

@riverpod
UpdateProfileUseCase updateProfileUseCase(Ref ref) {
  return UpdateProfileUseCase(ref.watch(profileRepositoryProvider));
}

@Riverpod(keepAlive: true)
 class Profile extends _$Profile {
  @override
  Future<ProfileState> build() async {
    final memberId = await ref.read(sessionRepositoryProvider).getCurrentMemberId();
    final member = await ref.read(getOwnProfileUseCaseProvider).call(memberId);
    return ProfileState(member: member);
  }

  void startEditing() {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(mode: ProfileMode.editing, editError: null));
  }

  void cancelEditing() {
    final current = state.value;
    if (current == null) return;
    state = AsyncData(current.copyWith(mode: ProfileMode.view, editError: null));
  }

  Future<void> save({required String fullName, required String phoneNumber}) async {
    final current = state.value;
    if (current == null) return;

    if (fullName.trim().isEmpty) {
      state = AsyncData(current.copyWith(editError: 'Full name is required.'));
      return;
    }

    state = AsyncData(current.copyWith(isSaving: true, editError: null));
    try {
      final memberId = await ref.read(sessionRepositoryProvider).getCurrentMemberId();
      final updated = await ref.read(updateProfileUseCaseProvider).call(
        memberId: memberId,
        fullName: fullName.trim(),
        phoneNumber: phoneNumber.trim(),
      );
      state = AsyncData(ProfileState(member: updated)); // back to view mode, fresh data
    } catch (e) {
      state = AsyncData(current.copyWith(isSaving: false, editError: 'Save failed: $e'));
    }
  }
}