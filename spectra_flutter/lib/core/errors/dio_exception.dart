import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handle(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please try again.";
      case DioExceptionType.sendTimeout:
        return "Request timed out while sending data.";
      case DioExceptionType.receiveTimeout:
        return "Server took too long to respond.";
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        final data = e.response?.data;
        return "Server error: $status - ${data['detail']}";
      case DioExceptionType.cancel:
        return "Request was cancelled.";
      case DioExceptionType.connectionError:
        return "Failed to connect to server. Please check your internet.";
      default:
        return "${e.message}";
    }
  }
}
