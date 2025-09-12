// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HttpErrorImpl _$$HttpErrorImplFromJson(Map<String, dynamic> json) =>
    _$HttpErrorImpl(
      error: json['error'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$HttpErrorImplToJson(_$HttpErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'description': instance.description,
    };
