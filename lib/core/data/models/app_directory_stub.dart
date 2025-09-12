import '../../domain/entities/app_directory.dart';

class AppDirectoryImpl implements AppDirectory {
  AppDirectoryImpl(String _);

  @override
  AppDirectory get absolute => throw UnimplementedError();

  @override
  Future<AppDirectory> create({bool recursive = false}) {
    throw UnimplementedError();
  }

  @override
  bool exists() {
    throw UnimplementedError();
  }

  @override
  AppDirectory get parent => throw UnimplementedError();

  @override
  String get path => throw UnimplementedError();
}
