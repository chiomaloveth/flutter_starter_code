// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      status: $enumDecodeNullable(_$APIStatusEnumMap, json['status']) ??
          APIStatus.failed,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'status': _$APIStatusEnumMap[instance.status]!,
      'message': instance.message,
    };

const _$APIStatusEnumMap = {
  APIStatus.success: 'success',
  APIStatus.failed: 'failed',
};
