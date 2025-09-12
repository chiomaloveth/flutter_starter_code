import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin DeviceOrientationMixin<T extends StatefulWidget> on State<T> {
  /// blocks rotation; sets orientation to: portrait only
  void disableLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  void enableLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
