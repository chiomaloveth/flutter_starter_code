// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      password: json['password'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      avatar: json['profile_picture'] as String?,
      showOvulationTracker: json['show_ovulation_tracker'] as bool? ?? true,
      pushNotification: json['push_notification'] as bool? ?? true,
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      subscriptionEndDate: json['subscription_end_date'] == null
          ? null
          : DateTime.parse(json['subscription_end_date'] as String),
      setupData: json['setup_data'] == null
          ? const AccountSetUpData()
          : AccountSetUpData.fromJson(
              json['setup_data'] as Map<String, dynamic>),
      streak: (json['user_current_calorie_streak'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
      'gender': instance.gender,
      if (instance.avatar case final value?) 'profile_picture': value,
      'show_ovulation_tracker': instance.showOvulationTracker,
      'push_notification': instance.pushNotification,
      if (instance.deletedAt?.toIso8601String() case final value?)
        'deleted_at': value,
      if (instance.subscriptionEndDate?.toIso8601String() case final value?)
        'subscription_end_date': value,
      'setup_data': instance.setupData.toJson(),
      'user_current_calorie_streak': instance.streak,
    };

_$AccountSetUpDataImpl _$$AccountSetUpDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountSetUpDataImpl(
      isProfileSetup: json['isProfileSetup'] as bool? ?? true,
      isCaloriesSetup: json['isCaloriesSetup'] as bool? ?? true,
      isMindSpaceSetup: json['isMindSpaceSetup'] as bool? ?? true,
      isOvulationSetup: json['isOvulationSetup'] as bool? ?? true,
      isTriviaSetup: json['isTriviaSetup'] as bool? ?? true,
    );

Map<String, dynamic> _$$AccountSetUpDataImplToJson(
        _$AccountSetUpDataImpl instance) =>
    <String, dynamic>{
      'isProfileSetup': instance.isProfileSetup,
      'isCaloriesSetup': instance.isCaloriesSetup,
      'isMindSpaceSetup': instance.isMindSpaceSetup,
      'isOvulationSetup': instance.isOvulationSetup,
      'isTriviaSetup': instance.isTriviaSetup,
    };
