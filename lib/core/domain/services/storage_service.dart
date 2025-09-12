import 'package:dartz/dartz.dart';

import '../../data/config/failure.dart';
import '../exceptions/error_code.dart';

abstract interface class StorageService {
  Future<Either<Failure<ErrorCode>, bool>> store<E>(String key, E value, {StorageEncoder<E>? encoder});
  Future<Either<Failure<ErrorCode>, bool>> remove(String key);
  Future<Either<Failure<ErrorCode>, E?>> get<E>(String key, {StorageDecoder<E>? decoder});
}

typedef StorageEncoder<E> = String Function(E value);
typedef StorageDecoder<E> = E? Function(String value);
