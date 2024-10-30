import 'package:dio/dio.dart';
import 'package:whisk_and_serve_core/api/network_exception.dart';

/// A client for making network requests using the Dio library.
///
/// This class encapsulates HTTP methods (GET, POST, PUT, DELETE)
/// and handles errors by converting DioExceptions into NetworkExceptions.
/// 
class NetworkClient {
  final Dio dio;

  /// Creates a [NetworkClient] with the specified [baseUrl].
  ///
  /// The [baseUrl] is used as the base for all requests made by this client.
  /// It also initializes a [Dio] instance with interceptors.
  NetworkClient({required String baseUrl})
      : dio = Dio(
          BaseOptions(baseUrl: baseUrl),
        ) {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  /// Performs a generic GET request to the specified [path].
  ///
  /// The [queryParams] can be provided to include query parameters in the request.
  /// 
  /// Throws a [NetworkException] if a DioException occurs during the request.
  Future<Response> getRequest(String path,
      {Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  /// Performs a generic POST request to the specified [path].
  ///
  /// The [data] to be sent in the body of the request can be specified.
  /// Additional [queryParams] can also be provided.
  ///
  /// Throws a [NetworkException] if a DioException occurs during the request.
  Future<Response> postRequest(String path,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.post(path, data: data, queryParameters: queryParams);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  /// Performs a generic PUT request to the specified [path].
  ///
  /// The [data] to be sent in the body of the request can be specified.
  /// Additional [queryParams] can also be provided.
  ///
  /// Throws a [NetworkException] if a DioException occurs during the request.
  Future<Response> putRequest(String path,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.put(path, data: data, queryParameters: queryParams);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  /// Performs a generic DELETE request to the specified [path].
  ///
  /// The [queryParams] can be provided to include query parameters in the request.
  ///
  /// Throws a [NetworkException] if a DioException occurs during the request.
  Future<Response> deleteRequest(String path,
      {Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.delete(path, queryParameters: queryParams);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
