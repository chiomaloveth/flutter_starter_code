import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:url_launcher/url_launcher_string.dart';

import '../../domain/services/launcher_service.dart';

typedef LaunchUrlFunction = Future<bool> Function(Uri uri);
typedef LaunchUrlStringFunction = Future<bool> Function(String url);
typedef CanLaunchUrlFunction = Future<bool> Function(Uri url);

@LazySingleton(as: LauncherService)
class LauncherServiceImpl extends LauncherService {
  LauncherServiceImpl([
    @ignoreParam LaunchUrlFunction? launchUrlImp,
    @ignoreParam LaunchUrlStringFunction? launchUrlStringImp,
    @ignoreParam CanLaunchUrlFunction? canLaunchUrlImp,
  ]) : _launchUrlImp = launchUrlImp ?? url.launchUrl,
       _launchUrlStringImp = launchUrlStringImp ?? launchUrlString,
       _canLaunchUrlImp = canLaunchUrlImp ?? url.canLaunchUrl;

  final LaunchUrlFunction _launchUrlImp;
  final LaunchUrlStringFunction _launchUrlStringImp;
  final CanLaunchUrlFunction _canLaunchUrlImp;

  final Logger _logger = Logger('UrlLauncherLauncherService');

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Future<bool> launchEmail(String emailAddress, {String? subject, String? body}) async {
    try {
      final uri = Uri(
        scheme: 'mailto',
        path: emailAddress,
        query: _encodeQueryParameters(<String, String>{
          if (subject != null) 'subject': subject,
          if (body != null) 'body': body,
        }),
      );

      final res = await _launchUrlImp(uri);
      return res;
    } catch (e, s) {
      _logger.info('Unexpected error launching email app to compose to $emailAddress', e, s);
      return false;
    }
  }

  @override
  Future<bool> launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      _logger.info('Invalid url received: $url');
      return false;
    }

    try {
      if (await _canLaunchUrlImp(uri)) {
        final res = await _launchUrlImp(uri);
        return res;
      }
      _logger.info('Cannot launch url: $url');
      return false;
    } catch (e, s) {
      _logger.info('Unexpected error launching url', e, s);
      return false;
    }
  }

  @override
  Future<bool> launchNewEmptyEmail() async {
    try {
      final uri = Uri(scheme: 'mailto');
      final res = await _launchUrlImp(uri);
      return res;
    } catch (e, s) {
      _logger.info('Unexpected error launching empty email app to compose', e, s);
      return false;
    }
  }

  @override
  Future<bool> openDefaultEmailApp() async {
    try {
      if (!kIsWeb && Platform.isAndroid) {
        const intent = AndroidIntent(
          action: 'android.intent.action.MAIN',
          category: 'android.intent.category.APP_EMAIL',
        );
        await intent.launch();
        return true;
      }
      await _launchUrlStringImp('message://');
      return true;
    } catch (e, s) {
      _logger.info('Unexpected error launching email app to read messages', e, s);
      return false;
    }
  }
}
