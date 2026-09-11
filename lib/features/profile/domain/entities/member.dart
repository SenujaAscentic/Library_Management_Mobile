import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

@freezed
abstract class Member with _$Member {
  const factory Member({
    required String id,
    required String fullName,
    required String email,
    required String phoneNumber,
    required DateTime registeredDate,
    required bool isActive,
  }) = _Member;
}