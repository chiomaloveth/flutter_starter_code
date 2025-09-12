import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nova/features/auth/data/model/auth_const.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'core/data/config/environment.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<GetIt> configureDependencies(AppEnvironment env) async {
  getIt.registerSingleton<AppEnvironment>(env);
  return getIt.init();
}

@module
abstract class InjectableModule {
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @Named('apiUrl')
  String get apiUrl => getIt<AppEnvironment>().apiUrl;

  @lazySingleton
  GoogleSignIn googleSignIn(AppEnvironment env) => GoogleSignIn(
    clientId: kIsWeb || Platform.isIOS ? env.firebaseOptions.iosClientId : env.firebaseOptions.androidClientId,
    scopes: kIsWeb ? AuthConst.googleScopes : const [],
  );
}
