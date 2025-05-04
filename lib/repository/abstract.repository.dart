import 'dart:convert';
import '../data/error.dart';
import 'package:dio/dio.dart';
import '../utils/logger.dart';
import '../common/exceptions/request.exception.dart';
import 'package:config_flutter/services/preferer.service.dart';

class AbstractRepository {
  final String authKey;
  final String? contentType;

  AbstractRepository({
    this.authKey = 'Authorization',
    this.contentType,
  });

  Future<Dio> dio() async {
    var token = await PrefererService.getToken();
    var headers = <String, String>{};

    if (token != null) {
      Log.d(token);
      headers.addAll({authKey: 'Bearer $token'});
    }

    var baseOptions = BaseOptions(headers: headers);
    if (contentType != null) {
      baseOptions.contentType = contentType;
    }

    var dio = Dio(baseOptions);

    return dio;
  }

  Future<dynamic> genericGet(String uri, {String? version}) async {
    Log.i(uri);

    var dio = await this.dio();

    if (version != null) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            var headers = <String, dynamic>{'Accept': version};
            options.headers.addAll(headers);
            return handler.next(options); //continue
          },
        ),
      );
    }

    try {
      var response = await dio.get(uri);

      return response.data;
    } on DioException catch (error, stacktrace) {
      catchError(error, stacktrace);
    }
  }

  Future<dynamic> genericPost(String uri, Map<String, dynamic> data) async {
    Log.i(uri);
    var dio = await this.dio();

    try {
      var response = await dio.post(uri, data: jsonEncode(data));

      if (response.statusCode == 204) {
        return {};
      }

      return response.data;
    } on DioException catch (error, stacktrace) {
      catchError(error, stacktrace);
    }
  }

  Future<dynamic> genericPostData(String uri, dynamic data) async {
    Log.i(uri);
    var dio = await this.dio();

    try {
      var response = await dio.post(uri, data: jsonEncode(data));

      if (response.statusCode == 204) {
        return {};
      }

      return response.data;
    } on DioException catch (error, stacktrace) {
      catchError(error, stacktrace);
    }
  }

  Future<dynamic> genericPut(String uri, Map<String, dynamic> data) async {
    var dio = await this.dio();

    try {
      var response = await dio.put(uri, data: jsonEncode(data));

      return response.data;
    } on DioException catch (error, stacktrace) {
      catchError(error, stacktrace);
    }
  }

  Future<dynamic> genericDelete(String uri) async {
    Log.i(uri);
    var dio = await this.dio();

    try {
      var response = await dio.delete(uri);
      Log.i(response.data);

      return response.data;
    } on DioException catch (error, stacktrace) {
      catchError(error, stacktrace);
    }
  }

  Future<dynamic> genericPatch(String uri, Map<String, dynamic> data) async {
    Log.i(uri);
    var dio = await this.dio();

    Log.i(data);

    try {
      var response = await dio.patch(uri, data: data);
      Log.i(response.data);

      return response.data;
    } on DioException catch (error, stacktrace) {
      catchError(error, stacktrace);
    }
  }

  void catchError(DioException exception, StackTrace stack) {
    Log.e('AbsstractRepository -> CatchError', exception, stack);

    var errorDescription = '';

    switch (exception.type) {
      case DioExceptionType.cancel:
        errorDescription = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionError:
        errorDescription = 'Connection error with API server';
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = 'Connection timeout with API server';
        break;
      case DioExceptionType.unknown:
        errorDescription =
            'Connection to API server failed due to internet connection';
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badCertificate:
        errorDescription = 'Receive bad certificate';
        break;
      case DioExceptionType.badResponse:
        if (exception.response?.data is Map) {
          var erro = Erro.fromJson(exception.response?.data);
          throw RequestException(erro.toString(), erro, dioError: exception);
        }

        throw RequestException(
          exception.response?.data,
          Erro(
            code: -1,
            message: exception.response?.data,
          ),
          dioError: exception,
        );
      case DioExceptionType.sendTimeout:
        errorDescription = 'Timeout';
        break;
    }

    throw Exception(errorDescription);
  }
}
