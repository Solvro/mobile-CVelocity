import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_base/dio_singleton.dart';
import 'skill_model.dart';

part 'skill_repo.g.dart';

@riverpod
class SkillRepository extends _$SkillRepository {
  @override
  FutureOr<List<Skill>> build() async {
    final dio = await ref.watch(dioSingletonProvider.future);
    final response = await dio.get('/skills');
    return response.data
        .map((e) => Skill.fromJson(e))
        .toList()
        .whereType<Skill>()
        .toList();
  }

  Future<void> addSkill(Skill skill) async {
    final dio = await ref.read(dioSingletonProvider.future);
    await dio.post('/skills', data: skill.toJson());
    ref.invalidateSelf();
  }
}
