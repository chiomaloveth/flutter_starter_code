import 'dart:math';

extension NumExtension on num {
  bool isBetween(num min, num max) => this >= min && this <= max;

  bool isNotBetween(num min, num max) => !isBetween(min, max);

  String toBytesFormat() {
    if (this <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final n = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, n)).toStringAsFixed(1)} ${suffixes[n]}';
  }
}
