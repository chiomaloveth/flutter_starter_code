import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppClipBoardUtil {
  static Future<void> copyString({
    required BuildContext context,
    required String content,
    String successMessage = 'Copied to clipboard',
  }) async {
    final data = ClipboardData(text: content);
    await Clipboard.setData(data);
  }
}
