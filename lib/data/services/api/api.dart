import 'package:dio/dio.dart';

export 'setup.dart';

class ApiService {
  Dio dio;

  ApiService(this.dio);

  Future<Response> getApi({
    required String url,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) =>
      dio.get(
        url,
        queryParameters: params,
        cancelToken: cancelToken,
      );

  Future<Response> postApi({
    required String url,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
  }) =>
      dio.post(
        url,
        data: body,
        cancelToken: cancelToken,
      );

  Future<Response> patchApi({
    required String url,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
  }) =>
      dio.patch(
        url,
        data: body,
        cancelToken: cancelToken,
      );

  Future<Response> putApi({
    required String url,
    dynamic body,
    CancelToken? cancelToken,
  }) =>
      dio.put(
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
      dio.delete(
        url,
        queryParameters: params,
        cancelToken: cancelToken,
        data: body,
      );
}
