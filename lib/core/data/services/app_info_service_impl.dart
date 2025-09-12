import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/entities/app_package_info.dart';
import '../../domain/entities/version_number.dart';
import '../../domain/exceptions/error_code.dart';
import '../../domain/services/app_info_service.dart';

@Singleton(as: AppInfoService)
class AppInfoServiceImpl implements AppInfoService {
  const AppInfoServiceImpl(this._packageInfo);

  static final Logger _logger = Logger('AppInfoServiceImpl');

  final PackageInfo _packageInfo;

  @override
  Future<Either<ErrorCode, AppPackageInfo>> getPackageInfo() async {
    try {
      final versionParts = _packageInfo.version.split('-');
      final version = versionParts.first;
      final buildNumber = _packageInfo.buildNumber;
      final tag = versionParts.length > 1 ? versionParts[1] : null;

      return Right(AppPackageInfo(version: version, buildNumber: buildNumber, tag: tag));
    } catch (e, s) {
      _logger.severe('Unexpected error in fetching package info:', e, s);
      return const Left(ErrorCode.unknownError);
    }
  }

  @override
  Future<VersionNumber> getVersionNumber() async {
    try {
      final packageInfo = await getPackageInfo();
      if (packageInfo.isRight()) {
        final success = packageInfo.getOrElse(() => throw Exception('Failed to get package info'));
        final versionNumber = VersionNumber.parse(
          version: success.version,
          buildNumber: success.buildNumber,
          tag: success.tag,
        );
        if (versionNumber != null) {
          return versionNumber;
        }
      }

      return VersionNumber.zero;
    } catch (e, s) {
      _logger.info('Error getting version number', e, s);
      return VersionNumber.zero;
    }
  }

  @postConstruct
  void logPackageInfo() => _logPackageInfo();

  Future<void> _logPackageInfo() async {
    _logger.info('App Package Info:');
    final info = await getPackageInfo();
    info.fold(
      (error) => _logger.warning('Failed to get package info: $error'),
      (info) => _logger.info('Version: ${info.version}, Build Number: ${info.buildNumber}, Tag: ${info.tag}'),
    );
  }
}
