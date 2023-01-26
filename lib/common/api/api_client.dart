import 'package:dio/dio.dart';
import 'package:news_app/utils/api_utils.dart';

class ApiClient {
  late final Dio dio;

  ApiClient({required this.dio}) {
    dio
      ..options.baseUrl = ApiUtils.baseUrl
      ..options.connectTimeout = ApiUtils.connectionTimeout
      ..options.receiveTimeout = ApiUtils.receiveTimeout
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
