import 'package:dio/dio.dart';

dynamic errorInterceptor(DioError err, ErrorInterceptorHandler handler) async {
  return handler.next(err);
}
