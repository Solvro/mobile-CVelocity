import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_base/dio_singleton.dart';
import 'tag_model.dart';

part 'tags_repo.g.dart';

@riverpod
class TagsRepository extends _$TagsRepository {
  @override
  FutureOr<List<Tag>> build() async {
    final dio = await ref.watch(dioSingletonProvider.future);
    final response = await dio.get('/tags');
    return response.data
        .map((e) => Tag.fromJson(e))
        .toList()
        .whereType<Tag>()
        .toList();
  }

  Future<void> addTag(Tag tag) async {
    final dio = await ref.read(dioSingletonProvider.future);
    await dio.post('/tags', data: tag.toJson());
    ref.invalidateSelf();
  }
}
