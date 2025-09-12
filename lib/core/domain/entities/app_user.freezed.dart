// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_picture')
  String? get avatar => throw _privateConstructorUsedError;
  bool get showOvulationTracker => throw _privateConstructorUsedError;
  bool get pushNotification => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime? get subscriptionEndDate => throw _privateConstructorUsedError;
  AccountSetUpData get setupData => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_current_calorie_streak')
  int get streak => throw _privateConstructorUsedError;

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String password,
      String gender,
      @JsonKey(name: 'profile_picture') String? avatar,
      bool showOvulationTracker,
      bool pushNotification,
      DateTime? deletedAt,
      DateTime? subscriptionEndDate,
      AccountSetUpData setupData,
      @JsonKey(name: 'user_current_calorie_streak') int streak});

  $AccountSetUpDataCopyWith<$Res> get setupData;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? gender = null,
    Object? avatar = freezed,
    Object? showOvulationTracker = null,
    Object? pushNotification = null,
    Object? deletedAt = freezed,
    Object? subscriptionEndDate = freezed,
    Object? setupData = null,
    Object? streak = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      showOvulationTracker: null == showOvulationTracker
          ? _value.showOvulationTracker
          : showOvulationTracker // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotification: null == pushNotification
          ? _value.pushNotification
          : pushNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscriptionEndDate: freezed == subscriptionEndDate
          ? _value.subscriptionEndDate
          : subscriptionEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      setupData: null == setupData
          ? _value.setupData
          : setupData // ignore: cast_nullable_to_non_nullable
              as AccountSetUpData,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountSetUpDataCopyWith<$Res> get setupData {
    return $AccountSetUpDataCopyWith<$Res>(_value.setupData, (value) {
      return _then(_value.copyWith(setupData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String password,
      String gender,
      @JsonKey(name: 'profile_picture') String? avatar,
      bool showOvulationTracker,
      bool pushNotification,
      DateTime? deletedAt,
      DateTime? subscriptionEndDate,
      AccountSetUpData setupData,
      @JsonKey(name: 'user_current_calorie_streak') int streak});

  @override
  $AccountSetUpDataCopyWith<$Res> get setupData;
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? gender = null,
    Object? avatar = freezed,
    Object? showOvulationTracker = null,
    Object? pushNotification = null,
    Object? deletedAt = freezed,
    Object? subscriptionEndDate = freezed,
    Object? setupData = null,
    Object? streak = null,
  }) {
    return _then(_$AppUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      showOvulationTracker: null == showOvulationTracker
          ? _value.showOvulationTracker
          : showOvulationTracker // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotification: null == pushNotification
          ? _value.pushNotification
          : pushNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscriptionEndDate: freezed == subscriptionEndDate
          ? _value.subscriptionEndDate
          : subscriptionEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      setupData: null == setupData
          ? _value.setupData
          : setupData // ignore: cast_nullable_to_non_nullable
              as AccountSetUpData,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AppUserImpl implements _AppUser {
  const _$AppUserImpl(
      {required this.id,
      required this.email,
      this.firstName = '',
      this.lastName = '',
      this.password = '',
      this.gender = '',
      @JsonKey(name: 'profile_picture') this.avatar,
      this.showOvulationTracker = true,
      this.pushNotification = true,
      this.deletedAt = null,
      this.subscriptionEndDate = null,
      this.setupData = const AccountSetUpData(),
      @JsonKey(name: 'user_current_calorie_streak') this.streak = 1});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey(name: 'profile_picture')
  final String? avatar;
  @override
  @JsonKey()
  final bool showOvulationTracker;
  @override
  @JsonKey()
  final bool pushNotification;
  @override
  @JsonKey()
  final DateTime? deletedAt;
  @override
  @JsonKey()
  final DateTime? subscriptionEndDate;
  @override
  @JsonKey()
  final AccountSetUpData setupData;
  @override
  @JsonKey(name: 'user_current_calorie_streak')
  final int streak;

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, firstName: $firstName, lastName: $lastName, password: $password, gender: $gender, avatar: $avatar, showOvulationTracker: $showOvulationTracker, pushNotification: $pushNotification, deletedAt: $deletedAt, subscriptionEndDate: $subscriptionEndDate, setupData: $setupData, streak: $streak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.showOvulationTracker, showOvulationTracker) ||
                other.showOvulationTracker == showOvulationTracker) &&
            (identical(other.pushNotification, pushNotification) ||
                other.pushNotification == pushNotification) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.subscriptionEndDate, subscriptionEndDate) ||
                other.subscriptionEndDate == subscriptionEndDate) &&
            (identical(other.setupData, setupData) ||
                other.setupData == setupData) &&
            (identical(other.streak, streak) || other.streak == streak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      password,
      gender,
      avatar,
      showOvulationTracker,
      pushNotification,
      deletedAt,
      subscriptionEndDate,
      setupData,
      streak);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
          {required final String id,
          required final String email,
          final String firstName,
          final String lastName,
          final String password,
          final String gender,
          @JsonKey(name: 'profile_picture') final String? avatar,
          final bool showOvulationTracker,
          final bool pushNotification,
          final DateTime? deletedAt,
          final DateTime? subscriptionEndDate,
          final AccountSetUpData setupData,
          @JsonKey(name: 'user_current_calorie_streak') final int streak}) =
      _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get password;
  @override
  String get gender;
  @override
  @JsonKey(name: 'profile_picture')
  String? get avatar;
  @override
  bool get showOvulationTracker;
  @override
  bool get pushNotification;
  @override
  DateTime? get deletedAt;
  @override
  DateTime? get subscriptionEndDate;
  @override
  AccountSetUpData get setupData;
  @override
  @JsonKey(name: 'user_current_calorie_streak')
  int get streak;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountSetUpData _$AccountSetUpDataFromJson(Map<String, dynamic> json) {
  return _AccountSetUpData.fromJson(json);
}

/// @nodoc
mixin _$AccountSetUpData {
  bool get isProfileSetup => throw _privateConstructorUsedError;
  bool get isCaloriesSetup => throw _privateConstructorUsedError;
  bool get isMindSpaceSetup => throw _privateConstructorUsedError;
  bool get isOvulationSetup => throw _privateConstructorUsedError;
  bool get isTriviaSetup => throw _privateConstructorUsedError;

  /// Serializes this AccountSetUpData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountSetUpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountSetUpDataCopyWith<AccountSetUpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSetUpDataCopyWith<$Res> {
  factory $AccountSetUpDataCopyWith(
          AccountSetUpData value, $Res Function(AccountSetUpData) then) =
      _$AccountSetUpDataCopyWithImpl<$Res, AccountSetUpData>;
  @useResult
  $Res call(
      {bool isProfileSetup,
      bool isCaloriesSetup,
      bool isMindSpaceSetup,
      bool isOvulationSetup,
      bool isTriviaSetup});
}

/// @nodoc
class _$AccountSetUpDataCopyWithImpl<$Res, $Val extends AccountSetUpData>
    implements $AccountSetUpDataCopyWith<$Res> {
  _$AccountSetUpDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountSetUpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProfileSetup = null,
    Object? isCaloriesSetup = null,
    Object? isMindSpaceSetup = null,
    Object? isOvulationSetup = null,
    Object? isTriviaSetup = null,
  }) {
    return _then(_value.copyWith(
      isProfileSetup: null == isProfileSetup
          ? _value.isProfileSetup
          : isProfileSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isCaloriesSetup: null == isCaloriesSetup
          ? _value.isCaloriesSetup
          : isCaloriesSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isMindSpaceSetup: null == isMindSpaceSetup
          ? _value.isMindSpaceSetup
          : isMindSpaceSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isOvulationSetup: null == isOvulationSetup
          ? _value.isOvulationSetup
          : isOvulationSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isTriviaSetup: null == isTriviaSetup
          ? _value.isTriviaSetup
          : isTriviaSetup // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountSetUpDataImplCopyWith<$Res>
    implements $AccountSetUpDataCopyWith<$Res> {
  factory _$$AccountSetUpDataImplCopyWith(_$AccountSetUpDataImpl value,
          $Res Function(_$AccountSetUpDataImpl) then) =
      __$$AccountSetUpDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isProfileSetup,
      bool isCaloriesSetup,
      bool isMindSpaceSetup,
      bool isOvulationSetup,
      bool isTriviaSetup});
}

/// @nodoc
class __$$AccountSetUpDataImplCopyWithImpl<$Res>
    extends _$AccountSetUpDataCopyWithImpl<$Res, _$AccountSetUpDataImpl>
    implements _$$AccountSetUpDataImplCopyWith<$Res> {
  __$$AccountSetUpDataImplCopyWithImpl(_$AccountSetUpDataImpl _value,
      $Res Function(_$AccountSetUpDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountSetUpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProfileSetup = null,
    Object? isCaloriesSetup = null,
    Object? isMindSpaceSetup = null,
    Object? isOvulationSetup = null,
    Object? isTriviaSetup = null,
  }) {
    return _then(_$AccountSetUpDataImpl(
      isProfileSetup: null == isProfileSetup
          ? _value.isProfileSetup
          : isProfileSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isCaloriesSetup: null == isCaloriesSetup
          ? _value.isCaloriesSetup
          : isCaloriesSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isMindSpaceSetup: null == isMindSpaceSetup
          ? _value.isMindSpaceSetup
          : isMindSpaceSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isOvulationSetup: null == isOvulationSetup
          ? _value.isOvulationSetup
          : isOvulationSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      isTriviaSetup: null == isTriviaSetup
          ? _value.isTriviaSetup
          : isTriviaSetup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountSetUpDataImpl implements _AccountSetUpData {
  const _$AccountSetUpDataImpl(
      {this.isProfileSetup = true,
      this.isCaloriesSetup = true,
      this.isMindSpaceSetup = true,
      this.isOvulationSetup = true,
      this.isTriviaSetup = true});

  factory _$AccountSetUpDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountSetUpDataImplFromJson(json);

  @override
  @JsonKey()
  final bool isProfileSetup;
  @override
  @JsonKey()
  final bool isCaloriesSetup;
  @override
  @JsonKey()
  final bool isMindSpaceSetup;
  @override
  @JsonKey()
  final bool isOvulationSetup;
  @override
  @JsonKey()
  final bool isTriviaSetup;

  @override
  String toString() {
    return 'AccountSetUpData(isProfileSetup: $isProfileSetup, isCaloriesSetup: $isCaloriesSetup, isMindSpaceSetup: $isMindSpaceSetup, isOvulationSetup: $isOvulationSetup, isTriviaSetup: $isTriviaSetup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountSetUpDataImpl &&
            (identical(other.isProfileSetup, isProfileSetup) ||
                other.isProfileSetup == isProfileSetup) &&
            (identical(other.isCaloriesSetup, isCaloriesSetup) ||
                other.isCaloriesSetup == isCaloriesSetup) &&
            (identical(other.isMindSpaceSetup, isMindSpaceSetup) ||
                other.isMindSpaceSetup == isMindSpaceSetup) &&
            (identical(other.isOvulationSetup, isOvulationSetup) ||
                other.isOvulationSetup == isOvulationSetup) &&
            (identical(other.isTriviaSetup, isTriviaSetup) ||
                other.isTriviaSetup == isTriviaSetup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isProfileSetup, isCaloriesSetup,
      isMindSpaceSetup, isOvulationSetup, isTriviaSetup);

  /// Create a copy of AccountSetUpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountSetUpDataImplCopyWith<_$AccountSetUpDataImpl> get copyWith =>
      __$$AccountSetUpDataImplCopyWithImpl<_$AccountSetUpDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountSetUpDataImplToJson(
      this,
    );
  }
}

abstract class _AccountSetUpData implements AccountSetUpData {
  const factory _AccountSetUpData(
      {final bool isProfileSetup,
      final bool isCaloriesSetup,
      final bool isMindSpaceSetup,
      final bool isOvulationSetup,
      final bool isTriviaSetup}) = _$AccountSetUpDataImpl;

  factory _AccountSetUpData.fromJson(Map<String, dynamic> json) =
      _$AccountSetUpDataImpl.fromJson;

  @override
  bool get isProfileSetup;
  @override
  bool get isCaloriesSetup;
  @override
  bool get isMindSpaceSetup;
  @override
  bool get isOvulationSetup;
  @override
  bool get isTriviaSetup;

  /// Create a copy of AccountSetUpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountSetUpDataImplCopyWith<_$AccountSetUpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
