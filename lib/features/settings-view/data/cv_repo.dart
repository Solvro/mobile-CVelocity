import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api_base/dio_singleton.dart';
import '../../auth_view/business/auth_service.dart';
import '../../auth_view/business/auth_state.dart';
import '../../profile-preview-view/models/cv.dart';

part 'cv_repo.g.dart';

@riverpod
class CvRepository extends _$CvRepository {
  @override
  Future<Cv> build() async {
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
