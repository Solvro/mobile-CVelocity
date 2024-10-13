import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../skills/skill_model.dart';
import '../../tags/tag_model.dart';

part 'cv_form_model.freezed.dart';
part 'cv_form_model.g.dart';
part 'cv_form_model.gform.dart';

@freezed
@Rf()
class CvForm with _$CvForm {
  const factory CvForm({
    @RfControl(validators: [RequiredValidator()]) String? fullName,
    @RfControl(validators: [RequiredValidator()]) String? title,
    @RfControl(validators: [RequiredValidator()]) String? phoneNumber,
    @RfArray() @Default([]) List<Tag> tags,
    @RfArray() @Default([]) List<Skill> skills,
    @RfArray() @Default([]) List<ExperienceForm> experience,
    @RfArray() @Default([]) List<EducationForm> education,
    @RfControl(validators: [RequiredValidator()]) String? description,
    @RfControl(validators: [RequiredValidator()]) String? photo,
    @RfControl(validators: [RequiredValidator()]) bool? isRemote,
    @RfControl(validators: [RequiredValidator()]) int? searchRange,
  }) = _CvForm;

  factory CvForm.fromJson(Map<String, dynamic> json) => _$CvFormFromJson(json);
}

@freezed
@Rf()
@RfGroup()
class ExperienceForm with _$ExperienceForm {
  const factory ExperienceForm({
    @RfControl(validators: [RequiredValidator()]) String? company,
    @RfControl(validators: [RequiredValidator()]) String? position,
    @RfControl(validators: [RequiredValidator()]) String? duration,
  }) = _ExperienceForm;

  factory ExperienceForm.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFormFromJson(json);
}

@freezed
@Rf()
@RfGroup()
class EducationForm with _$EducationForm {
  const factory EducationForm({
    @RfControl(validators: [RequiredValidator()]) String? institution,
    @RfControl(validators: [RequiredValidator()]) String? degree,
    @RfControl(validators: [RequiredValidator()]) String? year,
  }) = _EducationForm;

  factory EducationForm.fromJson(Map<String, dynamic> json) =>
      _$EducationFormFromJson(json);
}
