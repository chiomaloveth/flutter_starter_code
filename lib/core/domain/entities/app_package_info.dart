class AppPackageInfo {
  AppPackageInfo({
    required this.version,
    required this.buildNumber,
    this.tag, // e.g. 'beta', 'alpha', 'rc', 'dev', etc.
  });

  final String version;
  final String buildNumber;
  final String? tag;
}
