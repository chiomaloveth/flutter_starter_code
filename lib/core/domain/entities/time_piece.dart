import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_piece.freezed.dart';

/// As we are currently in the process of migrating to cloud functions,
/// we need to allow converting from multiple formats of time.
/// This class encapsulates the various formats that could be used and allows
/// for easy conversion between them.
@freezed
class TimePiece with _$TimePiece {
  const factory TimePiece(DateTime dateTime) = _TimePiece;
  factory TimePiece.now() => TimePiece(DateTime.now());

  const TimePiece._();

  int get millisecondsSinceEpoch => dateTime.millisecondsSinceEpoch;

  TimePiece toUtc() => TimePiece(dateTime.toUtc());
  TimePiece toLocal() => TimePiece(dateTime.toLocal());
}
