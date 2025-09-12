import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_direction.g.dart';

@JsonEnum(alwaysCreate: true)
enum CursorDirection {
  newer,
  older;

  factory CursorDirection.fromJson(String json) =>
      _$CursorDirectionEnumMap.map((key, value) => MapEntry(value, key))[json]!;

  String toJson() => _$CursorDirectionEnumMap[this]!;
}
