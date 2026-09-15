import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/member.dart';

part 'profile_state.freezed.dart';

enum ProfileMode { view, editing }

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Member member,
    @Default(ProfileMode.view) ProfileMode mode,
    @Default(false) bool isSaving,
    String? editError,
  }) = _ProfileState;
}