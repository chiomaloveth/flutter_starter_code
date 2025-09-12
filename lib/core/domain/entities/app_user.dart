import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/config/types.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AppUser({
    required Id id,
    required String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String password,
    @Default('') String gender,
    @JsonKey(name: 'profile_picture') String? avatar,
    @Default(true) bool showOvulationTracker,
    @Default(true) bool pushNotification,
    @Default(null) DateTime? deletedAt,
    @Default(null) DateTime? subscriptionEndDate,
    @Default(AccountSetUpData()) AccountSetUpData setupData,
    @JsonKey(name: 'user_current_calorie_streak') @Default(1) int streak,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}

extension AppUserX on AppUser {
  String get fullName => '$firstName $lastName';
}

@freezed
class AccountSetUpData with _$AccountSetUpData {
  const factory AccountSetUpData({
    @Default(true) bool isProfileSetup,
    @Default(true) bool isCaloriesSetup,
    @Default(true) bool isMindSpaceSetup,
    @Default(true) bool isOvulationSetup,
    @Default(true) bool isTriviaSetup,
  }) = _AccountSetUpData;

  factory AccountSetUpData.fromJson(Map<String, dynamic> json) => _$AccountSetUpDataFromJson(json);
}

extension AccountSetUpDataX on AccountSetUpData {
  bool get isSetUpComplete => isProfileSetup && isCaloriesSetup && isMindSpaceSetup && isOvulationSetup;
}
