import '../../domain/entities/app_update_response.dart';

abstract class AppUpdateService {
  Future<AppUpdateResponse> checkForUpdate();
  Future<String> fetchLatestVersion();
  Future<String> fetchMinimumVersion();
  Future<int> fetchLatestVersionBuildNumber();
  Future<int> fetchMinimumVersionBuildNumber();
  Future<String> fetchUpdateUrl();
  bool isUpdateRequired({
    required String currentVersion,
    required String latestVersion,
    int? currentBuildNumber,
    int? latestBuildNumber,
  });
}
