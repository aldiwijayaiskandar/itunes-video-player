import 'package:dio/dio.dart';
import 'package:video_player_app/config/config.dart';
import 'package:video_player_app/data/services/api/interceptors/interceptors.dart';

Dio setupDio({String? contentType}) {
  BaseOptions options = BaseOptions(
    baseUrl: Environment.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    contentType: contentType,
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
