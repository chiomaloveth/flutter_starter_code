import 'package:firebase_core/firebase_core.dart';

import '../../services/firebase/firebase_options.dart' as fb_prod;
import '../../services/firebase/firebase_options_dev.dart' as fb_dev;

enum AppEnvironment {
  dev,
  local,
  prod,
  test;

  String get apiUrl => switch (this) {
    AppEnvironment.prod => 'https://niigma-backend-service-6gdy.onrender.com',
    _ => 'https://niigma-backend-service-6gdy.onrender.com',
  };
  String get apiDomain => switch (this) {
    _ => 'https://niigma-backend-service-6gdy.onrender.com',
  };

  bool get isProd => this == AppEnvironment.prod;

  static AppEnvironment fromString(String? env) => switch (env) {
    'dev' => AppEnvironment.dev,
    'local' => AppEnvironment.local,
    'prod' => AppEnvironment.prod,
    'test' => AppEnvironment.test,
    _ => AppEnvironment.prod,
  };

  FirebaseOptions get firebaseOptions =>
      this == AppEnvironment.prod
          ? fb_prod.DefaultFirebaseOptions.currentPlatform
          : fb_dev.DefaultFirebaseOptions.currentPlatform;
}
