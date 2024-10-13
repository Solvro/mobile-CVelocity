import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth_view/business/auth_service.dart';
import '../auth_view/business/auth_state.dart';

part 'dio_singleton.g.dart';

@Riverpod(keepAlive: true)
Dio simpleDio(SimpleDioRef ref) {
  return Dio(
    BaseOptions(
      baseUrl: "https://cvelocity.besthack.solvro.pl/api/v1",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}

@Riverpod(keepAlive: true)
Future<Dio> dioSingleton(DioSingletonRef ref) async {
  final authState = await ref.read(authServiceProvider.future);
  Logger().i("authState: $authState");
  return Dio(
    BaseOptions(
      baseUrl: "https://cvelocity.besthack.solvro.pl/api/v1",
      headers: {
        "Content-Type": "application/json",
        if (authState is LoggedJobSeeker)
          "Authorization": "Bearer ${(authState).token.value}",
        if (authState is LoggedCompany)
          "Authorization": "Bearer ${(authState).token.value}"
      },
    ),
  );
}
