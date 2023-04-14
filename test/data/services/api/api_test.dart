import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_player_app/data/services/api/api.dart';

import '../../../mocks/dio.dart';

void main() {
  final Dio dio = DioMock();
  late ApiService apiService;

  const String data = "test";
  final Future<Response> response = Future(
    () => Response(
      requestOptions: RequestOptions(),
      data: data,
    ),
  );

  setUp(() {
    apiService = ApiService(dio);
  });

  test("Get api", () async {
    when(() => dio.get("/")).thenAnswer((_) => response);

    final result = await apiService.getApi(url: "/");

    expect(result.data, data);
  });

  test("Post api", () async {
    when(() => dio.post("/")).thenAnswer((_) => response);

    final result = await apiService.postApi(url: "/");

    expect(result.data, data);
  });

  test("Patch api", () async {
    when(() => dio.patch("/")).thenAnswer((_) => response);

    final result = await apiService.patchApi(url: "/");

    expect(result.data, data);
  });

  test("Put api", () async {
    when(() => dio.put("/")).thenAnswer((_) => response);

    final result = await apiService.putApi(url: "/");

    expect(result.data, data);
  });

  test("Delete api", () async {
    when(() => dio.delete("/")).thenAnswer((_) => response);

    final result = await apiService.deleteApi(url: "/");

    expect(result.data, data);
  });
}
