import 'dart:async';

import '../../data/models/app_directory_stub.dart'
    if (dart.library.io) '../../data/models/app_directory_native.dart'
    if (dart.library.js) '../../data/models/app_directory_browser.dart';

/// Create a directory abstraction that would work on both web and native.
/// We're using same Directory Apis but just only the core ones we are
/// interested in.
abstract class AppDirectory {
  factory AppDirectory(String path) => AppDirectoryImpl(path);

  FutureOr<bool> exists();

  FutureOr<AppDirectory> create({bool recursive = false});

  AppDirectory get parent;

  AppDirectory get absolute;

  String get path;

  @override
  String toString() => path;
}
