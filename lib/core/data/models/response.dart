import '../../domain/entities/api_status.dart';

abstract class Response<E> {
  APIStatus get status;
  E? get data;
  String? get message;
}
