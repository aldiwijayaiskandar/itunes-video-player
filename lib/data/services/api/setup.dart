import 'package:dio/dio.dart';
import 'package:video_player_app/config/config.dart';

Dio setupDio({String? contentType}) {
  BaseOptions options = BaseOptions(
    baseUrl: Environment.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    contentType: contentType,
  );

  return Dio(options);
}
