import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../../domain/entities/app_file.dart';

class AppFileImpl implements AppFile {
  AppFileImpl(String path) : _file = File(path);

  final File _file;

  @override
  FutureOr<void> delete({bool recursive = false}) {
    _file.deleteSync(recursive: recursive);
  }

  @override
  FutureOr<bool> exists() {
    return _file.existsSync();
  }

  @override
  FutureOr<int> length() => _file.lengthSync();

  @override
  FutureOr<AppFile> create({bool recursive = false}) {
    return _file.create(recursive: recursive).then((File file) => AppFileImpl(file.path));
  }

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

    return _file.writeAsBytes(bytes, mode: fileMode, flush: flush).then((File file) => AppFileImpl(file.path));
  }

  @override
  bool get hasNativeSupport => true;

  @override
  Object get nativeFile => _file;

  @override
  String toString() => path;
}
