// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppUpdateResponse {
  String get updateUrl => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  int get buildNumber => throw _privateConstructorUsedError;
  bool get forceUpdate => throw _privateConstructorUsedError;
  bool get canUpdate => throw _privateConstructorUsedError;

  /// Create a copy of AppUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUpdateResponseCopyWith<AppUpdateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateResponseCopyWith<$Res> {
  factory $AppUpdateResponseCopyWith(
          AppUpdateResponse value, $Res Function(AppUpdateResponse) then) =
      _$AppUpdateResponseCopyWithImpl<$Res, AppUpdateResponse>;
  @useResult
  $Res call(
      {String updateUrl,
      String version,
      int buildNumber,
      bool forceUpdate,
      bool canUpdate});
}

/// @nodoc
class _$AppUpdateResponseCopyWithImpl<$Res, $Val extends AppUpdateResponse>
    implements $AppUpdateResponseCopyWith<$Res> {
  _$AppUpdateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUrl = null,
    Object? version = null,
    Object? buildNumber = null,
    Object? forceUpdate = null,
    Object? canUpdate = null,
  }) {
    return _then(_value.copyWith(
      updateUrl: null == updateUrl
          ? _value.updateUrl
          : updateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      canUpdate: null == canUpdate
          ? _value.canUpdate
          : canUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUpdateResponseImplCopyWith<$Res>
    implements $AppUpdateResponseCopyWith<$Res> {
  factory _$$AppUpdateResponseImplCopyWith(_$AppUpdateResponseImpl value,
          $Res Function(_$AppUpdateResponseImpl) then) =
      __$$AppUpdateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String updateUrl,
      String version,
      int buildNumber,
      bool forceUpdate,
      bool canUpdate});
}

/// @nodoc
class __$$AppUpdateResponseImplCopyWithImpl<$Res>
    extends _$AppUpdateResponseCopyWithImpl<$Res, _$AppUpdateResponseImpl>
    implements _$$AppUpdateResponseImplCopyWith<$Res> {
  __$$AppUpdateResponseImplCopyWithImpl(_$AppUpdateResponseImpl _value,
      $Res Function(_$AppUpdateResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUrl = null,
    Object? version = null,
    Object? buildNumber = null,
    Object? forceUpdate = null,
    Object? canUpdate = null,
  }) {
    return _then(_$AppUpdateResponseImpl(
      updateUrl: null == updateUrl
          ? _value.updateUrl
          : updateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int,
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      canUpdate: null == canUpdate
          ? _value.canUpdate
          : canUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppUpdateResponseImpl
    with DiagnosticableTreeMixin
    implements _AppUpdateResponse {
  const _$AppUpdateResponseImpl(
      {required this.updateUrl,
      required this.version,
      required this.buildNumber,
      required this.forceUpdate,
      required this.canUpdate});

  @override
  final String updateUrl;
  @override
  final String version;
  @override
  final int buildNumber;
  @override
  final bool forceUpdate;
  @override
  final bool canUpdate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUpdateResponse(updateUrl: $updateUrl, version: $version, buildNumber: $buildNumber, forceUpdate: $forceUpdate, canUpdate: $canUpdate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUpdateResponse'))
      ..add(DiagnosticsProperty('updateUrl', updateUrl))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('buildNumber', buildNumber))
      ..add(DiagnosticsProperty('forceUpdate', forceUpdate))
      ..add(DiagnosticsProperty('canUpdate', canUpdate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateResponseImpl &&
            (identical(other.updateUrl, updateUrl) ||
                other.updateUrl == updateUrl) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.forceUpdate, forceUpdate) ||
                other.forceUpdate == forceUpdate) &&
            (identical(other.canUpdate, canUpdate) ||
                other.canUpdate == canUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, updateUrl, version, buildNumber, forceUpdate, canUpdate);

  /// Create a copy of AppUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateResponseImplCopyWith<_$AppUpdateResponseImpl> get copyWith =>
      __$$AppUpdateResponseImplCopyWithImpl<_$AppUpdateResponseImpl>(
          this, _$identity);
}

abstract class _AppUpdateResponse implements AppUpdateResponse {
  const factory _AppUpdateResponse(
      {required final String updateUrl,
      required final String version,
      required final int buildNumber,
      required final bool forceUpdate,
      required final bool canUpdate}) = _$AppUpdateResponseImpl;

  @override
  String get updateUrl;
  @override
  String get version;
  @override
  int get buildNumber;
  @override
  bool get forceUpdate;
  @override
  bool get canUpdate;

  /// Create a copy of AppUpdateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUpdateResponseImplCopyWith<_$AppUpdateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
