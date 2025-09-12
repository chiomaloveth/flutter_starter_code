import 'dart:async';
import 'dart:typed_data';

import '../../domain/entities/app_file.dart';

class AppFileImpl implements AppFile {
  AppFileImpl(String _);

  @override
  FutureOr<void> delete({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  FutureOr<bool> exists() {
    throw UnimplementedError();
  }

  @override
  FutureOr<int> length() => throw UnimplementedError();

  @override
  String get path => throw UnimplementedError();

  @override
  Future<Uint8List> readAsBytes() {
    throw UnimplementedError();
  }

  @override
  Future<AppFile> writeAsBytes(List<int> bytes, {XFileMode mode = XFileMode.write, bool flush = false}) {
    throw UnimplementedError();
  }

  @override
  bool get hasNativeSupport => false;

  @override
  Object get nativeFile => throw UnimplementedError();

  @override
  FutureOr<AppFile> create({bool recursive = false}) {
    throw UnimplementedError();
  }
}
