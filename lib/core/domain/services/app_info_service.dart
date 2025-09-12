import 'package:dartz/dartz.dart';

import '../entities/app_package_info.dart';
import '../entities/version_number.dart';
import '../exceptions/error_code.dart';

/// Service to get information about the app version and package
abstract interface class AppInfoService {
  /// Return package info containing version and build number
  Future<Either<ErrorCode, AppPackageInfo>> getPackageInfo();

  /// Return package info containing version and build number
  Future<VersionNumber> getVersionNumber();
}
