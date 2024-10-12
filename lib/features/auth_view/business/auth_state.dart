import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/token_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loggedJobSeeker({
    required TokenModel token,
  }) = LoggedJobSeeker;

  const factory AuthState.loggedCompany({
    required TokenModel token,
  }) = LoggedCompany;

  const factory AuthState.unauthenticated() = Unauthenticated;
}
