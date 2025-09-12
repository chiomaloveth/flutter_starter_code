import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/api_status.dart';
import 'response.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true, toStringOverride: true)
class ApiResponse<T> with _$ApiResponse<T> implements Response<T> {
  @JsonSerializable(genericArgumentFactories: true, createToJson: true)
  const factory ApiResponse({
    @Default(APIStatus.failed) APIStatus status,
    T? data,
    String? message,
    String? code,
    List<String>? params,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
