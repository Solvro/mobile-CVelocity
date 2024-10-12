import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'login_form_model.freezed.dart';
part 'login_form_model.gform.dart';

@freezed
@Rf()
class LoginFormModel with _$LoginFormModel {
  const factory LoginFormModel({
    @RfControl(validators: [RequiredValidator()]) String? email,
    @RfControl(validators: [RequiredValidator()]) String? password,
  }) = _LoginFormModel;
}
