// Represent exceptions from Server/Remote data source.
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  DioError dioError;

  NetworkException({required this.dioError});
}

// Represent exceptions from Cache.
class LocalException implements Exception {
  String error;

  LocalException(this.error);
}

class RouteException implements Exception {
  final String message;
  RouteException(this.message);
}
