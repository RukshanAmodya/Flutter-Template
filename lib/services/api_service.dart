import 'dart:developer';
import 'package:dio/dio.dart';
import 'storage_service.dart';

class ApiService {
  late final Dio _dio;
  
  // Custom API Base URL
  static const String baseUrl = 'https://api.example.com';

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    // Setup interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Retrieve storage service instance
          final storage = await StorageService.getInstance();
          final token = storage.authToken;
          
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          
          log('--> ${options.method} ${options.uri}');
          log('Headers: ${options.headers}');
          if (options.data != null) {
            log('Body: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('<-- ${response.statusCode} ${response.requestOptions.uri}');
          log('Response Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          log('<-- ERROR ${e.response?.statusCode} ${e.requestOptions.uri}');
          log('Error Message: ${e.message}');
          log('Error Data: ${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }

  // GET wrapper
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST wrapper
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT wrapper
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE wrapper
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Custom exception handling mapping
  Exception _handleError(DioException error) {
    String errorMessage = 'An unexpected error occurred';
    
    if (error.type == DioExceptionType.connectionTimeout || 
        error.type == DioExceptionType.receiveTimeout || 
        error.type == DioExceptionType.sendTimeout) {
      errorMessage = 'Network connection timed out';
    } else if (error.type == DioExceptionType.badResponse) {
      final status = error.response?.statusCode;
      errorMessage = 'Server error with code: $status';
    } else if (error.type == DioExceptionType.connectionError) {
      errorMessage = 'No internet connection';
    }
    
    return Exception(errorMessage);
  }
}
