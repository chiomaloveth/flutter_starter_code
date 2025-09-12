import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'version_number.freezed.dart';
part 'version_number.g.dart';

@freezed
class VersionNumber with _$VersionNumber implements Comparable<VersionNumber> {
  const factory VersionNumber({
    required int major,
    required int minor,
    required int patch,
    required int build,
    String? tag,
  }) = _VersionNumber;

  factory VersionNumber.fromJson(Map<String, dynamic> json) => _$VersionNumberFromJson(json);

  const VersionNumber._();

  static const VersionNumber zero = VersionNumber(major: 0, minor: 0, patch: 0, build: 0);

  static final _logger = Logger('VersionNumber');

  static final _parseStringRegex = RegExp(r'^(\d+)\.(\d+)\.(\d+)[\.|\+](\d+)$');

  /// Parses a [VersionNumber] from the given [version] and [buildNumber].
  ///
  /// The expected format is the major version number (base 10), followed by a
  /// dot, followed by the minor version number (base 10). Extra characters
  /// after the minor version number will be ignored.
  ///
  /// Returns null if a valid version number could not be parsed.
  static VersionNumber? parse({required String version, required String buildNumber, String? tag}) {
    final parts = version.split('-');
    final appVersion = parts.first;
    final appTag = tag ?? (parts.length > 1 ? parts[1] : null);
    final versionString = '$appVersion.$buildNumber';
    final match = _parseStringRegex.firstMatch(versionString);
    if (match == null) {
      _logger.severe('Failed to parse version number from $versionString.');
      return null;
    }

    final major = match.group(1) ?? '';
    final minor = match.group(2) ?? '';
    final patch = match.group(3) ?? '0';
    final build = match.group(4) ?? '0';

    VersionNumber? versionNumber;
    try {
      versionNumber = VersionNumber(
        major: int.parse(major, radix: 10),
        minor: int.parse(minor, radix: 10),
        patch: int.parse(patch, radix: 10),
        build: int.parse(build, radix: 10),
        tag: appTag,
      );
    } on FormatException catch (error, stackTrace) {
      _logger.severe('Failed to parse version number from $versionString.', error, stackTrace);
    }

    _logger.finer('Parsed $versionString as $versionNumber.');
    return versionNumber;
  }

  @override
  int compareTo(VersionNumber other) {
    if (major != other.major) {
      return major - other.major;
    } else if (minor != other.minor) {
      return minor - other.minor;
    } else if (patch != other.patch) {
      return patch - other.patch;
    } else {
      return build - other.build;
    }
  }

  bool operator <(VersionNumber other) => compareTo(other) < 0;

  bool operator <=(VersionNumber other) => compareTo(other) <= 0;

  bool operator >(VersionNumber other) => compareTo(other) > 0;

  bool operator >=(VersionNumber other) => compareTo(other) >= 0;

  @override
  String toString() {
    return '$major.$minor.$patch${tag == null ? '' : '-$tag'}+$build';
  }
}
