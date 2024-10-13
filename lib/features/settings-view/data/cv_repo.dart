import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth_view/business/auth_service.dart';
import '../../auth_view/business/auth_state.dart';
import '../../profile-preview-view/models/cv.dart';

part 'cv_repo.g.dart';

@riverpod
class CvRepository extends _$CvRepository {
  @override
  Future<Cv> build() async {
    final auth = await ref.watch(authServiceProvider.future);
    int? userId;
    if (auth is LoggedJobSeeker) {
      userId = auth.token.userId;
    }
    if (auth is LoggedCompany) {
      userId = auth.token.userId;
    }
    try {
      final response = await FirebaseFirestore.instance
          .collection('cvs')
          .doc(userId.toString())
          .get();
      return Cv.fromJson(response.data()!);
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

    int? userId;
    if (auth is LoggedJobSeeker) {
      userId = auth.token.userId;
    }
    if (auth is LoggedCompany) {
      userId = auth.token.userId;
    }
    final response = await FirebaseFirestore.instance
        .collection('cvs')
        .doc(userId.toString())
        .set(cv.toJson());
    return;
  }
}
