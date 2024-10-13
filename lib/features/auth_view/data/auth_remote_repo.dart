import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api_base/dio_singleton.dart';
import 'models/login_post_model.dart';
import 'models/register_post_model.dart';
import 'models/token_model.dart';

part 'auth_remote_repo.g.dart';

class AuthRemoteRepository {
  final Dio dio;

  AuthRemoteRepository(this.dio);

  Future<TokenModel> register(RegisterPostModel postModel) async {
    final token = await dio.post(
      '/auth/register',
      data: postModel.toJson(),
    );
    return TokenModel.fromJson(token.data);
  }

  Future<TokenModel> login(LoginPostModel postModel) async {
    final token = await dio.post(
      '/auth/token',
      data: postModel.toJson(),
    );
    return TokenModel.fromJson(token.data);
  }
}

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository(ref.watch(simpleDioProvider));
}
