import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../profile-preview-view/models/cv.dart';
import '../../skills/skill_model.dart';
import '../../tags/tag_model.dart';

part 'cv_repo.g.dart';

@riverpod
class CvRepository extends _$CvRepository {
  @override
  FutureOr<Cv> build() {
    return Cv(
      id: 1,
      title: "Software Engineer",
      phoneNumber: "+1234567890",
      fullName: "John Doe",
      tags: [
        const Tag(tag: "Mobile Development"),
        const Tag(tag: "Backend"),
      ],
      skills: [
        const Skill(skill: "Flutter"),
        const Skill(skill: "Dart"),
        const Skill(skill: "Node.js"),
      ],
      experience: [
        const Experience(
            company: "Tech Solutions Inc.",
            position: "Flutter Developer",
            duration: "24 years"),
        const Experience(
            company: "Web Innovations",
            position: "Backend Developer",
            duration: "24 years"),
      ],
      education: [
        const Education(
            institution: "State University",
            degree: "BSc Computer Science",
            year: "2016"),
        const Education(
            institution: "Tech Academy",
            degree: "Diploma in Mobile Development",
            year: "2018"),
      ],
      description:
          "Passionate software engineer with over 5 years of experience in mobile and backend development. Strong skills in Flutter and Node.js.",
      photo:
          "https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4",
      isRemote: true,
      searchRange: 50,
      createdAt: DateTime.parse("2024-10-01T12:00:00Z"),
      updatedAt: DateTime.parse("2024-10-10T08:30:00Z"),
    );
  }

  Future<void> putCv(Cv cv) async {
    return;
  }
}
