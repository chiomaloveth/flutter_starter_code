// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error.dart';

part 'http_error.freezed.dart';
part 'http_error.g.dart';

@freezed
class HttpError with _$HttpError implements Exception {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory HttpError({required String error, required String status, required String description}) = _HttpError;

  const HttpError._();

  factory HttpError.fromJson(Map<String, dynamic> json) => _$HttpErrorFromJson(json);

  ApiError toApiError() => ApiError(message: description);
}
