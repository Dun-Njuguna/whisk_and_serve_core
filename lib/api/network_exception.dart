import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? code;

  NetworkException({required this.message, this.code});

  static const _errorMessages = {
    DioExceptionType.connectionTimeout: "Connection Timeout",
    DioExceptionType.sendTimeout: "Send Timeout",
    DioExceptionType.receiveTimeout: "Receive Timeout",
    DioExceptionType.cancel: "Request to API server was cancelled",
    DioExceptionType.unknown: "Unexpected error occurred",
    DioExceptionType.badCertificate: "Bad certificate. Please check your network security.",
    DioExceptionType.connectionError: "Connection error. Unable to reach the server.",
  };

  factory NetworkException.fromDioError(DioException dioError) {
    final defaultMessage = _errorMessages[dioError.type] ?? "Unknown error";

    if (dioError.type == DioExceptionType.badResponse) {
      final statusCode = dioError.response?.statusCode;
      final errorMsg = dioError.response?.data['message'] ?? "Something went wrong";
      return NetworkException(message: errorMsg, code: statusCode);
    }

    return NetworkException(message: defaultMessage);
  }

  @override
  String toString() => 'Error $code: $message';
}
