import 'dart:async';
import 'dart:typed_data';

import '../../data/models/app_file_stub.dart'
    if (dart.library.io) '../../data/models/app_file_native.dart'
    if (dart.library.js) '../../data/models/app_file_browser.dart';

/// Create a file abstraction that would work on both web and native.
/// We're using same File Apis but just only the core ones we are
/// interested in.
abstract class AppFile {
  factory AppFile(String path) => AppFileImpl(path);

  String get path;

  FutureOr<bool> exists();

  FutureOr<int> length();

  FutureOr<AppFile> create({bool recursive = false});

  FutureOr<void> delete({bool recursive = false});

  Future<Uint8List> readAsBytes();

  Future<AppFile> writeAsBytes(List<int> bytes, {XFileMode mode = XFileMode.write, bool flush = false});

  /// If we can construct a file using the File class in dart io.
  /// This is particularly useful for reading files from native end
  /// directly as opposed to having it in memory which can be a
  /// performance drag.
  bool get hasNativeSupport;

  /// If supports native, we want to return the native file as Object.
  /// Users will cast it to the dart io File class.
  Object get nativeFile;

  @override
  String toString() => path;
}

enum XFileMode { read, write, append, writeOnly, writeOnlyAppend }
