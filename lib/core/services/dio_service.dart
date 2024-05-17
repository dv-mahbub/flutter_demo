import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/utils/constants/env.dart';

enum HTTPMethod { get, post, delete, patch, put }

// Class for configuring Dio instance
class DioService {
  DioService._internal(); // Private constructor

  static DioService? _instance; // Singleton instance variable

  // Singleton instance getter
  static DioService get instance {
    _instance ??= DioService._internal(); // Create instance if not exists
    return _instance!; // Return the instance
  }

  Dio? _dio; // Dio instance variable

  // Dio instance getter
  Dio get dio {
    // Lazy initialization of Dio instance
    _dio = _dio ??
        Dio(
          BaseOptions(
            baseUrl: APPENV.baseURl, // Base URL for requests
            connectTimeout: const Duration(seconds: 15), // Connection timeout
            receiveTimeout: const Duration(seconds: 15), // Receive timeout
          ),
        )
      ..interceptors.add(InterceptorsWrapper(
        // Add interceptors for handling requests, errors, and responses
        onRequest: (RequestOptions options, handler) {
          // Function to handle request
          return handler.next(options); // Pass request to next handler
        },
        onError: (DioException error, handler) async {
          // Function to handle error
          if (kDebugMode) {
            print("❗️======Dio error print start=====❗️");
            print("= = = Dio Error Response = = =");
            print('Error Response: ${error.response}');
            print('Error Message: ${error.message}');
            print('Error Type: ${error.type}');
            print('Error StausCode: ${error.response?.statusCode}');
            print("❗️======Dio error print end=====❗️");
          }
          return handler.next(error); // Pass error to next handler
        },
        onResponse: (Response response, handler) {
          // Function to handle response
          return handler.next(response); // Pass response to next handler
        },
      ));
    return _dio!; // Return Dio instance
  }
}

// Function to make HTTP requests using Dio instance
Future<Response> makeRequest({
  required String path,
  required HTTPMethod method,
  Map<String, dynamic>? data,
}) async {
  switch (method) {
    case HTTPMethod.get:
      return DioService.instance.dio.get(
        path,
      );
    case HTTPMethod.post:
      return DioService.instance.dio.post(
        path,
        data: data,
      );
    case HTTPMethod.put:
      return DioService.instance.dio.put(
        path,
        data: data,
      );
    case HTTPMethod.delete:
      return DioService.instance.dio.delete(
        path,
        data: data,
      );
    case HTTPMethod.patch:
      return DioService.instance.dio.patch(
        path,
        data: data,
      );
    default:
      throw ArgumentError('Unsupported HTTP method: $method');
  }
}
