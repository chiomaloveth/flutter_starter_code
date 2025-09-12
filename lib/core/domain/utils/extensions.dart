import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get size => MediaQuery.of(this).size;
  double get deviceHeight => size.height;
  double get deviceWidth => size.width;
  double scaledDeviceHeight(double h) => size.height * h;
  double scaledDeviceWidth(double w) => size.width * w;
}

extension WidgetOnTapExtension on Widget {
  InkWell onTap({required void Function()? onTap}) {
    return InkWell(onTap: onTap, child: this);
  }
}

extension PaddingExtension on Widget {
  Widget pad([double value = 8.0]) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget padSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }
}

extension RelativeTimeString on String {
  String toRelativeTime() {
    try {
      final date = DateTime.parse(this);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inMinutes < 60) {
        return '${diff.inMinutes}m';
      } else if (diff.inHours < 24) {
        return '${diff.inHours}h';
      } else if (diff.inDays < 7) {
        return '${diff.inDays}d';
      } else if (diff.inDays < 30) {
        return '${(diff.inDays / 7).floor()}w';
      } else if (diff.inDays < 365) {
        return '${(diff.inDays / 30).floor()}m';
      } else {
        return '${(diff.inDays / 365).floor()}y';
      }
    } catch (e) {
      return 'invalid date';
    }
  }
}
