import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_singleton.g.dart';

@Riverpod(keepAlive: true)
Dio dioSingleton(DioSingletonRef ref) {
  return Dio(
    BaseOptions(
      baseUrl: "https://cvelocity.besthack.solvro.pl/api/v1",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}
