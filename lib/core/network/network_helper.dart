import 'package:dio/dio.dart';

import '../errors/error_message_model.dart';
import '../errors/exeptions.dart';
import 'apps_headers.dart';

class NetworkHelper {
  final _dio = Dio();

  static NetworkHelper? _instance;

  NetworkHelper._();

  factory NetworkHelper() => _instance ??= NetworkHelper._();

  Future<AppResponse> post(String url,
      {Map<String, dynamic>? headers,
      Object? data,
      FormData? attachments}) async {
    try {
      final response = await _dio.post(url,
          data: attachments ?? data,
          options: Options(headers: headers ?? AppHeaders.header));
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(ErrorMessageModel.fromJson(e.response!.data),
            e.response!.statusCode);
      }
      throw const NoInternetException();
    }
  }

  Future<AppResponse> delete(String url,
      {Map<String, dynamic>? headers, Object? data}) async {
    try {
      final response = await _dio.delete(url,
          data: data, options: Options(headers: headers ?? AppHeaders.header));
      return response.toAppResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        throw ServerException(ErrorMessageModel.fromJson(e.response!.data),
            e.response!.statusCode);
      }
      throw const NoInternetException();
    }
  }

  Future<AppResponse> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(url,
          options: Options(headers: headers ?? AppHeaders.header));
      return response.toAppResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        throw ServerException(ErrorMessageModel.fromJson(e.response!.data),
            e.response!.statusCode);
      }
      throw const NoInternetException();
    }
  }

  Future<AppResponse> put(String url,
      {Map<String, dynamic>? headers,
      Object? data,
      FormData? attachments}) async {
    try {
      final response = await _dio.put(url,
          data: attachments ?? data,
          options: Options(headers: headers ?? AppHeaders.header));
      return response.toAppResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        throw ServerException(ErrorMessageModel.fromJson(e.response!.data),
            e.response!.statusCode);
      }
      throw const NoInternetException();
    }
  }
}

class AppResponse {
  final Map<String, String> headers;
  final data;
  final int? statusCode;

  AppResponse({required this.headers, this.data, this.statusCode});

  factory AppResponse.fromDio(Response response) => AppResponse(
      headers:
          response.headers.map.map((key, value) => MapEntry(key, value.first)),
      data: response.data,
      statusCode: response.statusCode);
}

extension DioToResponse on Response {
  AppResponse get toAppResponse => AppResponse.fromDio(this);
}
