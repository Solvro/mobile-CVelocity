import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api_base/error_response_model.dart';
import '../../api_base/wrap_with_error.dart';
import '../data/auth_local_repo.dart';
import '../data/auth_remote_repo.dart';
import '../data/models/login_post_model.dart';
import '../data/models/register_post_model.dart';
import '../data/models/token_model.dart';
import 'auth_state.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  @override
  Future<AuthState> build() async {
    final localToken = await ref.watch(authLocalRepositoryProvider.future);
    if (localToken != null) {
      if (localToken.isCompany) {
        return AuthState.loggedCompany(token: localToken);
      }
      return AuthState.loggedJobSeeker(token: localToken);
    }
    return const AuthState.unauthenticated();
  }

  Future<void> logout() async {
    await ref.read(authLocalRepositoryProvider.notifier).logout();
    
  }

  Future<Either<TokenModel, ErrorResponseModel>> login(
      LoginPostModel postModel) async {
    final remote = await ref
        .read(authRemoteRepositoryProvider)
        .login(postModel)
        .wrapWithError();
    if (remote.isLeft) {
      await ref
          .read(authLocalRepositoryProvider.notifier)
          .saveToken(remote.left);
    }
    return remote;
  }

  Future<Either<TokenModel, ErrorResponseModel>> register(
      RegisterPostModel postModel) async {
    final remote = await ref
        .read(authRemoteRepositoryProvider)
        .register(postModel)
        .wrapWithError();
    if (remote.isLeft) {
      await ref
          .read(authLocalRepositoryProvider.notifier)
          .saveToken(remote.left);
    }
    return remote;
  }
}
