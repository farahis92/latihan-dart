import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = '';
  int? code ;

  @override
  String toString() => message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        code = 499;
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        code = 408;
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        code = dioError.response?.statusCode;
        message = _handleError(dioError.response?.statusCode);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'Data Not Found';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }


}