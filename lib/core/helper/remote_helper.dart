import 'dart:developer';

import 'package:dio/dio.dart';
import '../shared/constant.dart';

class RemoteHelper {
  final Dio _dio = Dio();

  RemoteHelper() {
    log("RemoteHelper Created");
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add token to request header
          options.headers['Authorization'] = 'Bearer YOUR_TOKEN_HERE';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // Handle token expiration
          if (e.response?.statusCode == 401) {
            // Redirect to login page
            // ...
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> put(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(String path,
      {data, Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(path,
        data: data, queryParameters: queryParameters);
  }
}
