import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String jobTitle,
    required String company,
    required int experience,
  }) = _Experience;

  factory Experience.fromJson(Map<String, Object?> json) =>
      _$ExperienceFromJson(json);
}
