import 'package:freezed_annotation/freezed_annotation.dart';

import '../../skills/skill_model.dart';
import '../../tags/tag_model.dart';

part 'cv.freezed.dart';
part 'cv.g.dart';

@freezed
class Cv with _$Cv {
  const factory Cv({
    required int? id,
    required String? title,
    @JsonKey(name: 'phone_number') required String? phoneNumber,
    required String? fullName,
    required List<Tag> tags,
    required List<Skill> skills,
    required List<Experience> experience,
    required List<Education> education,
    required String? description,
    required String? photo,
    @JsonKey(name: 'is_remote') required bool? isRemote,
    @JsonKey(name: 'search_range') required int? searchRange,
    @JsonKey(name: 'created_at') required DateTime? createdAt,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'user_id') int? userId,
  }) = _Cv;

  factory Cv.fromJson(Map<String, dynamic> json) => _$CvFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String company,
    required String position,
    required String duration,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    required String institution,
    required String degree,
    required String year,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
