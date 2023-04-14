import 'package:dio/dio.dart';

dynamic requestInterceptor(
  RequestOptions options,
  RequestInterceptorHandler handler,
) async {
  handler.next(options);
}
