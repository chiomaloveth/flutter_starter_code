import 'package:dartz/dartz.dart';

import '../../data/config/failure.dart';
import '../exceptions/api_failure.dart';
import '../exceptions/error_code.dart';

extension FutureEitherExtension<T> on Future<Either<ErrorCode, T>> {
  Future<T> getOrDefault(T defaultValue) async {
    final result = await this;
    return result.fold((error) => defaultValue, (value) => value);
  }
}

extension FutureStringExtension<T> on Future<Either<String, T>> {
  Future<T> getOrDefault(T defaultValue) async {
    final result = await this;
    return result.fold((error) => defaultValue, (value) => value);
  }
}

extension ApiEitherExtension<T> on Future<Either<ApiFailure, T>> {
  Future<T> getOrDefault(T defaultValue) async {
    final result = await this;
    return result.fold((error) => defaultValue, (value) => value);
  }
}

extension FutureEitherExtension2<T> on Future<Either<Failure<ErrorCode>, T>> {
  Future<T> getOrDefault(T defaultValue) async {
    final result = await this;
    return result.fold((error) => defaultValue, (value) => value);
  }
}
