import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

import '../../../domain/entities/api_error.dart';
import '../../../domain/entities/api_status.dart';
import '../../models/response.dart' as api;

mixin ApiErrorHandlerMixin {
  Future<E?> execute<E>(Future<api.Response<E?>> Function() supplier) async {
    try {
      final response = await supplier.call();

      if (response.status == APIStatus.success) {
        return response.data;
      } else {
        throw ApiError(status: response.status, message: response.message!);
      }
    } on DioException catch (err, stackTrace) {
      throw handleDioException(err, stackTrace);
    } catch (e, t) {
      debugPrintStack(stackTrace: t, label: e.toString());
      throw const ApiError(message: 'Error processing response');
    }
  }

  Future<E> executeRaw<E>(Future<E> Function() supplier) async {
    try {
      return await supplier.call();
    } on DioException catch (err, stackTrace) {
      throw handleDioException(err, stackTrace);
    }
  }

  ApiError handleDioException(DioException err, StackTrace stackTrace) {
    try {
      final response = err.response;
      if (_isApiErrorResponse(response)) {
        return ApiError.fromJson(response!.data! as Map<String, dynamic>);
      } else if (_isHttpErrorResponse(response)) {
        return ApiError(message: err.message ?? '');
      }

      if (response?.data.toString().contains('Server Error') ?? false) {
        return const ApiError(message: 'Could not reach server, try again later');
      }

      if (err.error is NSErrorClientException) {
        return ApiError(message: (err.error as NSErrorClientException).message);
      }
    } catch (e, t) {
      Logger('name').severe(e, t);
    }

    return const ApiError(message: 'Could not reach server, check your internet and try again');
  }

  bool _isApiErrorResponse(Response<dynamic>? response) {
    if (response?.data is! Map<String, dynamic>) {
      return false;
    }

    final error = (response?.data ?? <String, dynamic>{}) as Map<String, dynamic>;

    return error['status'] == "failed";
  }

  bool _isHttpErrorResponse(Response<dynamic>? response) {
    try {
      final data = response?.toString();
      if (data == null) {
        return false;
      }
      final error = jsonDecode(data) as Map<String, dynamic>;

      return (error['status'] == 'failed' || error.containsKey('error')) && (response?.statusCode ?? 0) >= 400;
    } catch (e) {
      return false;
    }
  }
}
