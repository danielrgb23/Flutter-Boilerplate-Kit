import 'package:dio/dio.dart';
import 'package:config_flutter/data/error.dart';

class RequestException implements Exception {
  final Erro erro;
  final String message;
  final DioException? dioError;

  @override
  String toString() {
    return "${erro.code ?? ''} - ${erro.message ?? ''}";
  }

  RequestException(this.message, this.erro, {this.dioError});
}
