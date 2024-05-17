import 'package:dio/dio.dart';
import 'package:flutter_demo/core/models/view_state.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  Rx<ViewState> viewState = ViewState.initial.obs;
  Object? _exception;
  Object? get exception {
    return _exception;
  }

  set setException(Object? name) {
    _exception = name;
    viewState.value = ViewState.error;
  }

  String errorMsg() {
    if (exception is DioException) {
      final dioError = exception as DioException;
      if (dioError.type == DioExceptionType.cancel) {
        return "Request to API server was cancelled";
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        return "Connection timeout with API server";
      } else if (dioError.type == DioExceptionType.connectionError ||
          dioError.type == DioExceptionType.unknown) {
        return "There is no internet connection";
      } else if (dioError.type == DioExceptionType.receiveTimeout ||
          dioError.type == DioExceptionType.sendTimeout) {
        return "Timeout in connection with API server";
      } else if (dioError.type == DioExceptionType.badResponse) {
        return "Something went wrong! Try again";
      } else if (dioError.type == DioExceptionType.badCertificate) {
        return 'Bad certificate';
      } else {
        return "Something went wrong! Try again";
      }
    }
    return "Something went wrong! Try again";
  }
}
