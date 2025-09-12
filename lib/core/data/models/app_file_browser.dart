import 'dart:async';
import 'dart:typed_data';

import 'package:fs_shim/fs_browser.dart';

import '../../domain/entities/app_file.dart';

class AppFileImpl implements AppFile {
  AppFileImpl(String path) : _file = fileSystemIdb.file(path);

  // static final FileSystem _fs = fileSystemWeb;
  final File _file;

  @override
  FutureOr<void> delete({bool recursive = false}) => _file.delete(recursive: recursive);

  @override
  FutureOr<bool> exists() => _file.exists();

  @override
  FutureOr<int> length() => _file.stat().then((FileStat stat) => stat.size);

  @override
  FutureOr<AppFile> create({bool recursive = false}) {
    return _file.create(recursive: recursive).then((File file) => AppFileImpl(file.path));
  }

  @override
  bool get hasNativeSupport => false;

  @override
  Object get nativeFile => throw UnimplementedError();

  @override
  String get path => _file.path;

  @override
  Future<Uint8List> readAsBytes() {
    return _file.readAsBytes();
  }

  @override
  Future<AppFile> writeAsBytes(List<int> bytes, {XFileMode mode = XFileMode.write, bool flush = false}) {
    final fileMode = switch (mode) {
      XFileMode.read => FileMode.read,
      XFileMode.write => FileMode.write,
      XFileMode.append => FileMode.append,
      XFileMode.writeOnly => FileMode.write,
      XFileMode.writeOnlyAppend => FileMode.append,
    };

    return _file
        .writeAsBytes(Uint8List.fromList(bytes), mode: fileMode, flush: flush)
        .then((File file) => AppFileImpl(file.path));
  }

  @override
  String toString() => path;
}
