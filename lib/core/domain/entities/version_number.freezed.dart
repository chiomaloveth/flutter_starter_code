// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VersionNumber _$VersionNumberFromJson(Map<String, dynamic> json) {
  return _VersionNumber.fromJson(json);
}

/// @nodoc
mixin _$VersionNumber {
  int get major => throw _privateConstructorUsedError;
  int get minor => throw _privateConstructorUsedError;
  int get patch => throw _privateConstructorUsedError;
  int get build => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;

  /// Serializes this VersionNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VersionNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VersionNumberCopyWith<VersionNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionNumberCopyWith<$Res> {
  factory $VersionNumberCopyWith(
          VersionNumber value, $Res Function(VersionNumber) then) =
      _$VersionNumberCopyWithImpl<$Res, VersionNumber>;
  @useResult
  $Res call({int major, int minor, int patch, int build, String? tag});
}

/// @nodoc
class _$VersionNumberCopyWithImpl<$Res, $Val extends VersionNumber>
    implements $VersionNumberCopyWith<$Res> {
  _$VersionNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VersionNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? major = null,
    Object? minor = null,
    Object? patch = null,
    Object? build = null,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
      patch: null == patch
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int,
      build: null == build
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as int,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionNumberImplCopyWith<$Res>
    implements $VersionNumberCopyWith<$Res> {
  factory _$$VersionNumberImplCopyWith(
          _$VersionNumberImpl value, $Res Function(_$VersionNumberImpl) then) =
      __$$VersionNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int major, int minor, int patch, int build, String? tag});
}

/// @nodoc
class __$$VersionNumberImplCopyWithImpl<$Res>
    extends _$VersionNumberCopyWithImpl<$Res, _$VersionNumberImpl>
    implements _$$VersionNumberImplCopyWith<$Res> {
  __$$VersionNumberImplCopyWithImpl(
      _$VersionNumberImpl _value, $Res Function(_$VersionNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of VersionNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? major = null,
    Object? minor = null,
    Object? patch = null,
    Object? build = null,
    Object? tag = freezed,
  }) {
    return _then(_$VersionNumberImpl(
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
      patch: null == patch
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int,
      build: null == build
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as int,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionNumberImpl extends _VersionNumber {
  const _$VersionNumberImpl(
      {required this.major,
      required this.minor,
      required this.patch,
      required this.build,
      this.tag})
      : super._();

  factory _$VersionNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionNumberImplFromJson(json);

  @override
  final int major;
  @override
  final int minor;
  @override
  final int patch;
  @override
  final int build;
  @override
  final String? tag;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionNumberImpl &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor) &&
            (identical(other.patch, patch) || other.patch == patch) &&
            (identical(other.build, build) || other.build == build) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, major, minor, patch, build, tag);

  /// Create a copy of VersionNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionNumberImplCopyWith<_$VersionNumberImpl> get copyWith =>
      __$$VersionNumberImplCopyWithImpl<_$VersionNumberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionNumberImplToJson(
      this,
    );
  }
}

abstract class _VersionNumber extends VersionNumber {
  const factory _VersionNumber(
      {required final int major,
      required final int minor,
      required final int patch,
      required final int build,
      final String? tag}) = _$VersionNumberImpl;
  const _VersionNumber._() : super._();

  factory _VersionNumber.fromJson(Map<String, dynamic> json) =
      _$VersionNumberImpl.fromJson;

  @override
  int get major;
  @override
  int get minor;
  @override
  int get patch;
  @override
  int get build;
  @override
  String? get tag;

  /// Create a copy of VersionNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VersionNumberImplCopyWith<_$VersionNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
