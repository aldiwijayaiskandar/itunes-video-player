import 'package:dio/dio.dart';
import 'package:video_player_app/data/services/api/interceptors/interceptors.dart';

class ApiService {
  Dio setupDio({required String url, String? contentType}) {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: contentType,
      headers: {},
    );

    Dio dioOption = Dio(options);

    dioOption.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: requestInterceptor,
          onResponse: responseInterceptor,
          onError: errorInterceptor,
        ),
      ],
    );

    return dioOption;
  }

  Future<Response> getApi({
    required String url,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) =>
      setupDio(url: url).get(
        url,
        queryParameters: params,
        cancelToken: cancelToken,
      );

  Future<Response> postApi({
    required String url,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
  }) =>
      setupDio(url: url).post(
        url,
        data: body,
        cancelToken: cancelToken,
      );

  Future<Response> patchApi({
    required String url,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
  }) =>
      setupDio(url: url).patch(
        url,
        data: body,
        cancelToken: cancelToken,
      );

  Future<Response> putApi({
    required String url,
    dynamic body,
    CancelToken? cancelToken,
  }) =>
      setupDio(url: url).put(
        url,
        data: body,
        cancelToken: cancelToken,
      );

  Future<Response> deleteApi({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
  }) =>
      setupDio(url: url).delete(
        url,
        queryParameters: params,
        cancelToken: cancelToken,
        data: body,
      );
}
