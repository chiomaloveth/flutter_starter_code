// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionNumberImpl _$$VersionNumberImplFromJson(Map<String, dynamic> json) =>
    _$VersionNumberImpl(
      major: (json['major'] as num).toInt(),
      minor: (json['minor'] as num).toInt(),
      patch: (json['patch'] as num).toInt(),
      build: (json['build'] as num).toInt(),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$VersionNumberImplToJson(_$VersionNumberImpl instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
      'build': instance.build,
      if (instance.tag case final value?) 'tag': value,
    };
