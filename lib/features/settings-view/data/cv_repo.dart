import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api_base/dio_singleton.dart';
import '../../auth_view/business/auth_service.dart';
import '../../auth_view/business/auth_state.dart';
import '../../profile-preview-view/models/cv.dart';
import '../../skills/skill_model.dart';
import '../../tags/tag_model.dart';

part 'cv_repo.g.dart';

@riverpod
class CvRepository extends _$CvRepository {
  @override
  Future<Cv> build() async {
    final mockTags = [
      const Tag(tag: 'IT'),
      const Tag(tag: 'Software Development'),
    ];

    final mockSkills = [
      const Skill(skill: 'Software Development'),
      const Skill(skill: 'UI/UX Design'),
      const Skill(skill: 'Dart'),
      const Skill(skill: 'Flutter'),
    ];

    final mockExperience = [
      const Experience(
        company: 'ABC Corp',
        position: 'Software Engineer',
        duration: '2 years',
      ),
      const Experience(
        company: 'XYZ Inc',
        position: 'Junior Developer',
        duration: '1 year',
      ),
    ];

    final mockEducation = [
      const Education(
        institution: 'Some University',
        degree: 'B.Sc in Computer Science',
        year: '2018',
      ),
      const Education(
        institution: 'Another College',
        degree: 'Diploma in Software Engineering',
        year: '2015',
      ),
    ];

    // Mock CV
    final mockCv = Cv(
      id: 1,
      title: 'Senior Software Engineer CV',
      phoneNumber: '123-456-7890',
      fullName: 'John Doe',
      tags: mockTags,
      skills: mockSkills,
      experience: mockExperience,
      education: mockEducation,
      description:
          'An experienced software engineer with over 5 years of hands-on experience in designing, developing, and deploying high-performance mobile and web applications. Specializing in Flutter and Dart, I have successfully led and contributed to multiple cross-platform projects, delivering seamless user experiences across both Android and iOS platforms. My expertise extends to building scalable architectures, integrating third-party APIs, and optimizing application performance. I have a strong understanding of UI/UX principles, Agile methodologies, and a passion for clean, maintainable code. I thrive in collaborative, fast-paced environments and am constantly exploring the latest trends and technologies in mobile development.',
      photo:
          'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
      isRemote: true,
      searchRange: 50,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      userId: 1001,
    );
    return mockCv;
    final dio = await ref.watch(dioSingletonProvider.future);
    final auth = await ref.watch(authServiceProvider.future);
    int? userId;
    if (auth is LoggedJobSeeker) {
      userId = auth.token.userId;
    }
    if (auth is LoggedCompany) {
      userId = auth.token.userId;
    }
    try {
      final response = await dio.get("/users/$userId/cv");
      return Cv.fromJson(response.data);
    } catch (e) {
      return Cv(
        id: null,
        userId: userId,
        tags: [],
        skills: [],
        title: null,
        description: null,
        experience: [],
        education: [],
        createdAt: null,
        updatedAt: null,
        fullName: null,
        isRemote: null,
        phoneNumber: null,
        searchRange: null,
        photo: null,
      );
    }
  }

  Future<void> putCv(Cv cv) async {
    final auth = await ref.watch(authServiceProvider.future);
    final dio = await ref.watch(dioSingletonProvider.future);

    int? userId;
    if (auth is LoggedJobSeeker) {
      userId = auth.token.userId;
    }
    if (auth is LoggedCompany) {
      userId = auth.token.userId;
    }
    final response = dio.post("/cvs", data: cv.toJson());
    return;
  }
}
