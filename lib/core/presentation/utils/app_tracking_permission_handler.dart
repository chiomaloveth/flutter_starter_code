import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';

class AppTrackingPermissionHandler {
  static Future<String?> requestTrackingPermission() async {
    if (kIsWeb) return null;

    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(milliseconds: 1000));
    if (Platform.isIOS && int.parse(Platform.operatingSystemVersion.split(' ')[1].split('.')[0]) >= 14) {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status == TrackingStatus.authorized) {
        final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
        return uuid;
      } else if (status == TrackingStatus.notDetermined) {
        await AppTrackingTransparency.requestTrackingAuthorization();
        final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
        return uuid;
      }
    }

    return null;
  }
}
