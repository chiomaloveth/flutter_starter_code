import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_status.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError implements Exception {
  ///status can only be failed or success
  const factory ApiError({@Default(APIStatus.failed) APIStatus status, required String message}) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
}
