// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:just_audio/just_audio.dart' as _i501;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/data/config/environment.dart' as _i305;
import 'core/data/modules/audio_player_module.dart' as _i288;
import 'core/data/modules/dio_module.dart' as _i637;
import 'core/data/modules/firebase_module.dart' as _i121;
import 'core/data/modules/shared_preferences_module.dart' as _i80;
import 'core/data/services/app_info_service_impl.dart' as _i78;
import 'core/data/services/firebase_app_update_service.dart' as _i671;
import 'core/data/services/launcher_service_impl.dart' as _i199;
import 'core/data/services/persistent_storage_service.dart' as _i883;
import 'core/data/services/user_token_provider_service_impl.dart' as _i562;
import 'core/domain/services/app_info_service.dart' as _i578;
import 'core/domain/services/launcher_service.dart' as _i295;
import 'core/domain/services/storage_service.dart' as _i938;
import 'core/domain/services/user_token_provider_service.dart' as _i775;
import 'core/services/app_start_services.dart' as _i72;
import 'core/services/audio_player/audio_player_service.dart' as _i294;
import 'core/services/file_picker_service.dart' as _i320;
import 'core/services/general_utility_service.dart' as _i86;
import 'core/services/local_storage/local_storage_service.dart' as _i489;
import 'core/services/local_storage/token_local_storage.dart' as _i48;
import 'core/services/remote_config/app_update_service.dart' as _i938;
import 'injectable.dart' as _i1027;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    final audioPlayerModule = _$AudioPlayerModule();
    final firebaseModule = _$FirebaseModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i655.PackageInfo>(
      () => injectableModule.packageInfo,
      preResolve: true,
    );
    gh.singleton<_i501.AudioPlayer>(() => audioPlayerModule.audioPlayer());
    gh.singleton<_i627.FirebaseRemoteConfig>(() => firebaseModule.remoteConfig);
    gh.singleton<_i398.FirebaseAnalytics>(() => firebaseModule.analytics);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i558.FlutterSecureStorage>(
        () => sharedPreferencesModule.secureStorage);
    gh.lazySingleton<_i72.AppStartService>(() => _i72.AppStartService());
    gh.lazySingleton<_i320.FilePickerService>(() => _i320.FilePickerService());
    gh.lazySingleton<_i86.GeneralUtility>(() => _i86.GeneralUtility());
    gh.lazySingleton<_i48.TokenLocalStorage>(() => _i48.TokenLocalStorage());
    gh.lazySingleton<_i489.LocalStorageService>(() =>
        _i489.FlutterSecureStorageService(
            secureStorage: gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i295.LauncherService>(() => _i199.LauncherServiceImpl());
    gh.factory<_i775.UserTokenProviderService>(
        () => _i562.UserTokenProviderServiceImpl());
    gh.lazySingleton<_i938.AppUpdateService>(() =>
        _i671.FirebaseAppUpdateService(
            remoteConfig: gh<_i627.FirebaseRemoteConfig>()));
    gh.lazySingleton<_i637.TokenInterceptor>(
        () => _i637.TokenInterceptor(gh<_i775.UserTokenProviderService>()));
    gh.factory<String>(
      () => injectableModule.apiUrl,
      instanceName: 'apiUrl',
    );
    gh.lazySingleton<_i938.StorageService>(
        () => _i883.PersistentStorageService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i116.GoogleSignIn>(
        () => injectableModule.googleSignIn(gh<_i305.AppEnvironment>()));
    gh.singleton<_i578.AppInfoService>(() =>
        _i78.AppInfoServiceImpl(gh<_i655.PackageInfo>())..logPackageInfo());
    gh.singleton<_i294.AudioPlayerService>(
        () => audioPlayerModule.audioPlayerService(gh<_i501.AudioPlayer>()));
    gh.lazySingleton<_i637.AppendVersionHeaderInterceptor>(
        () => _i637.AppendVersionHeaderInterceptor(gh<_i578.AppInfoService>()));
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio(
          gh<_i305.AppEnvironment>(),
          gh<_i637.TokenInterceptor>(),
          gh<_i637.AppendVersionHeaderInterceptor>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i1027.InjectableModule {}

class _$AudioPlayerModule extends _i288.AudioPlayerModule {}

class _$FirebaseModule extends _i121.FirebaseModule {}

class _$SharedPreferencesModule extends _i80.SharedPreferencesModule {}

class _$DioModule extends _i637.DioModule {}
