import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

@Freezed(genericArgumentFactories: true, toStringOverride: true)
class PaginatedResponse<T> with _$PaginatedResponse {
  @JsonSerializable(genericArgumentFactories: true, createToJson: true)
  factory PaginatedResponse({@Default(0) int count, String? next, String? previous, @Default([]) List<T> results}) =
      _PaginatedResponse;

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}
