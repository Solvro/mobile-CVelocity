import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api_base/prefs_singleton.dart';
import 'models/token_model.dart';

part 'auth_local_repo.g.dart';

@Riverpod(keepAlive: true)
class AuthLocalRepository extends _$AuthLocalRepository {
  static const _key = "shared_prefs_token";
  static const _keyId = "shared_prefs_token_user_id";
  static const _keyIsCompany = "shared_prefs_token_isCompany";
  static const _keyFullName = "shared_prefs_token_fullName";

  @override
  FutureOr<TokenModel?> build() async {
    final prefs = await ref.watch(sharedPrefsSingletonProvider.future);
    final savedToken = prefs.getString(_key);
    final savedId = prefs.getInt(_keyId);
    final savedIsCompany = prefs.getBool(_keyIsCompany);
    final savedFullName = prefs.getString(_keyFullName);

    if (savedId == null || savedToken == null) {
      return null;
    }
    return TokenModel(
      fullName: savedFullName ?? "John Doe",
      isCompany: savedIsCompany ?? false,
      value: savedToken,
      userId: savedId,
      type: 'bearer',
    );
  }

  Future<void> logout() async {
    final prefs = await ref.watch(sharedPrefsSingletonProvider.future);
    await (prefs).remove(_key);
    await prefs.remove(_keyId);
    await prefs.remove(_keyIsCompany);
    await prefs.remove(_keyFullName);
    ref.invalidateSelf();
  }

  Future<void> saveToken(TokenModel tokenModel) async {
    await (await ref.watch(sharedPrefsSingletonProvider.future))
        .setString(_key, tokenModel.value);
    await (await ref.watch(sharedPrefsSingletonProvider.future))
        .setInt(_keyId, tokenModel.userId);
    await (await ref.watch(sharedPrefsSingletonProvider.future))
        .setString(_keyFullName, tokenModel.fullName);
    await (await ref.watch(sharedPrefsSingletonProvider.future))
        .setBool(_keyIsCompany, tokenModel.isCompany);
    ref.invalidateSelf();
  }
}
