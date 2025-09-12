import 'dart:math';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart';

class AppGenUtil {
  AppGenUtil._();

  static final Logger _logger = Logger('AppGenUtil');

  static String generateUniqueId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    return List.generate(24, (index) => chars[random.nextInt(chars.length)]).join();
  }

  static Future<void> offKeyboard() async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  }

  static Future<void> launchUrlText(String urlText) async {
    final uri = Uri.parse(urlText);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      _logger.severe('Cannot launch $urlText');
    }
  }
}
