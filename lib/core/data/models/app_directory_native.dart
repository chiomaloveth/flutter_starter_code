import 'dart:async';
import 'dart:io';

import '../../domain/entities/app_directory.dart';

class AppDirectoryImpl implements AppDirectory {
  AppDirectoryImpl(String path) : _directory = Directory(path);
  final Directory _directory;

  @override
  AppDirectory get absolute => AppDirectory(_directory.absolute.path);

  @override
  FutureOr<AppDirectory> create({bool recursive = false}) {
    return _directory.create(recursive: recursive).then((Directory directory) => AppDirectory(directory.path));
  }

  @override
  FutureOr<bool> exists() => _directory.existsSync();

  @override
  AppDirectory get parent => AppDirectory(_directory.parent.path);

  @override
  String get path => _directory.path;

  @override
  String toString() => path;
}
