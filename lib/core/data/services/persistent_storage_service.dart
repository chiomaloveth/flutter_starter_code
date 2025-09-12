import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/exceptions/error_code.dart';
import '../../domain/exceptions/failure.dart';
import '../../domain/services/storage_service.dart';
import '../config/failure.dart';

@LazySingleton(as: StorageService)
class PersistentStorageService implements StorageService {
  PersistentStorageService(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<Either<Failure<ErrorCode>, E?>> get<E>(String key, {StorageDecoder<E>? decoder}) async {
    if (decoder != null) {
      final value = _sharedPreferences.getString(key);
      if (value == null) {
        return const Right(null);
      }
      return Right(decoder.call(value));
    }

    return switch (true) {
      _ when E == String || E.toString() == 'String?' => Right(_sharedPreferences.getString(key) as E?),
      _ when E == int || E.toString() == 'int?' => Right(_sharedPreferences.getInt(key) as E?),
      _ when E == bool || E.toString() == 'bool?' => Right(_sharedPreferences.getBool(key) as E?),
      _ when E == double || E.toString() == 'double?' => Right(_sharedPreferences.getDouble(key) as E?),
      _ when (E == List<String>) || E.toString() == 'List<String>?' => Right(
        _sharedPreferences.getStringList(key) as E?,
      ),
      _ when E == Object || E.toString() == 'Object?' => Right(_sharedPreferences.get(key) as E?),
      _ => const Left(ErrorCodeFailure(ErrorCode.missingDecoder)),
    };
  }

  @override
  Future<Either<Failure<ErrorCode>, bool>> remove(String key) async {
    final result = await _sharedPreferences.remove(key);
    return Right(result);
  }

  @override
  Future<Either<Failure<ErrorCode>, bool>> store<E>(String key, E value, {StorageEncoder<E>? encoder}) async {
    if (encoder != null) {
      return Right(await _sharedPreferences.setString(key, encoder.call(value)));
    }

    return switch (true) {
      _ when E == String || E.toString() == 'String?' => Right(
        await _sharedPreferences.setString(key, value as String),
      ),
      _ when E == int || E.toString() == 'int?' => Right(await _sharedPreferences.setInt(key, value as int)),
      _ when E == bool || E.toString() == 'bool?' => Right(await _sharedPreferences.setBool(key, value as bool)),
      _ when E == double || E.toString() == 'double?' => Right(
        await _sharedPreferences.setDouble(key, value as double),
      ),
      _ when (E == List<String>) || E.toString() == 'List<String>?' => Right(
        await _sharedPreferences.setStringList(key, value as List<String>),
      ),
      _ => const Left(ErrorCodeFailure(ErrorCode.missingEncoder)),
    };
  }
}
