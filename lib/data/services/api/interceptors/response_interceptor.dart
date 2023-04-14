import 'package:dio/dio.dart';

dynamic responseInterceptor(
  Response<dynamic> response,
  ResponseInterceptorHandler handler,
) async {
  handler.next(response);
}
