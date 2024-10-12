import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_post_model.freezed.dart';
part 'login_post_model.g.dart';

@freezed
class LoginPostModel with _$LoginPostModel {
  const factory LoginPostModel({
    required String email,
    required String password,
  }) = _LoginPostModel;

  factory LoginPostModel.fromJson(Map<String, dynamic> json) =>
      _$LoginPostModelFromJson(json);
}
