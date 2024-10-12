import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'register_form_model.freezed.dart';
part 'register_form_model.gform.dart';

@freezed
@Rf()
class RegisterFormModel with _$RegisterFormModel {
  const factory RegisterFormModel({
    @RfControl(validators: [RequiredValidator()]) String? email,
    @RfControl(validators: [RequiredValidator()]) String? password,
    @RfControl(validators: [RequiredValidator()]) String? passwordConfirmation,
    @RfControl(validators: [RequiredValidator()]) String? fullName,
    @RfControl(validators: [RequiredValidator()])
    @Default(false)
    bool isCompany,
  }) = _RegisterFormModel;
}
