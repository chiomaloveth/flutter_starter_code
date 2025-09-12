import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppStartService {
  Future<void> onBoardingComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setBool("onboarding_complete", true);
    } catch (e) {
      if (kDebugMode) {
        print('Complete onboarding error!');
      }
    }
  }

  Future<bool> checkFirstTimeLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      bool launched = prefs.getBool("onboarding_complete") ?? false;
      return !launched;
    } catch (e) {
      return false;
    }
  }
}
