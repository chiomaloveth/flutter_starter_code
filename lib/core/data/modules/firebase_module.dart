import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @singleton
  FirebaseRemoteConfig get remoteConfig => FirebaseRemoteConfig.instance;

  @singleton
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
}
