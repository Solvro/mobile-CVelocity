import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_post_model.freezed.dart';
part 'register_post_model.g.dart';

@freezed
class RegisterPostModel with _$RegisterPostModel {
  const factory RegisterPostModel({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String fullName,
    required bool isCompany,
  }) = _RegisterPostModel;

  factory RegisterPostModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterPostModelFromJson(json);
}
