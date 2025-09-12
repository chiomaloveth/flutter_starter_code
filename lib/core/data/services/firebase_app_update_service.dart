import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/entities/app_update_response.dart';
import '../../domain/entities/version_number.dart';
import '../../services/remote_config/app_update_service.dart';

@LazySingleton(as: AppUpdateService)
class FirebaseAppUpdateService implements AppUpdateService {
  FirebaseAppUpdateService({FirebaseRemoteConfig? remoteConfig})
    : _remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance,
      _prefix = Platform.isAndroid ? 'android_' : 'ios_';

  static final Logger _logger = Logger('FirebaseAppUpdateService');

  final FirebaseRemoteConfig _remoteConfig;
  final String _prefix;

  @override
  Future<AppUpdateResponse> checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
    final currentVersion = packageInfo.version.split('-').first;

    _logger.fine('Current version: $currentVersion, build number: $currentBuildNumber');

    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(fetchTimeout: const Duration(seconds: 10), minimumFetchInterval: const Duration(hours: 1)),
      );
      await _remoteConfig.fetchAndActivate();

      final latestVersionBuildNumber = await fetchLatestVersionBuildNumber();
      final latestVersion = await fetchLatestVersion();
      final minimumVersionBuildNumber = await fetchMinimumVersionBuildNumber();
      final minimumVersion = await fetchMinimumVersion();

      final updateUrl = await fetchUpdateUrl();
      final minimumVersionNumber =
          VersionNumber.parse(version: minimumVersion, buildNumber: minimumVersionBuildNumber.toString())!;
      final currentVersionNumber =
          VersionNumber.parse(version: currentVersion, buildNumber: currentBuildNumber.toString())!;
      final forceUpdate = currentVersionNumber < minimumVersionNumber;

      final canUpdate = isUpdateRequired(
        currentVersion: currentVersion,
        latestVersion: latestVersion,
        currentBuildNumber: currentBuildNumber,
        latestBuildNumber: latestVersionBuildNumber,
      );

      if (!canUpdate) {
        _logger.fine('Build numbers are equal or current version is newer!');
      }

      return AppUpdateResponse(
        updateUrl: updateUrl,
        version: latestVersion,
        buildNumber: latestVersionBuildNumber,
        forceUpdate: forceUpdate,
        canUpdate: canUpdate,
      );
    } catch (e, s) {
      _logger.severe('Error fetching remote config', e, s);
      return AppUpdateResponse(
        updateUrl: '',
        version: currentVersion,
        buildNumber: currentBuildNumber,
        forceUpdate: false,
        canUpdate: false,
      );
    }
  }

  @override
  Future<String> fetchLatestVersion() async {
    return _remoteConfig.getString('${_prefix}app_version');
  }

  @override
  Future<String> fetchMinimumVersion() async {
    return _remoteConfig.getString('${_prefix}min_app_version');
  }

  @override
  Future<int> fetchLatestVersionBuildNumber() async {
    return _remoteConfig.getInt('${_prefix}build_number');
  }

  @override
  Future<int> fetchMinimumVersionBuildNumber() async {
    return _remoteConfig.getInt('${_prefix}min_build_number');
  }

  @override
  Future<String> fetchUpdateUrl() async {
    return _remoteConfig.getString('${_prefix}update_url');
  }

  @override
  bool isUpdateRequired({
    required String currentVersion,
    required String latestVersion,
    int? currentBuildNumber,
    int? latestBuildNumber,
  }) {
    final version1 = VersionNumber.parse(version: currentVersion, buildNumber: currentBuildNumber.toString())!;
    final version2 = VersionNumber.parse(version: latestVersion, buildNumber: latestBuildNumber.toString())!;

    return version1 < version2;
  }
}
