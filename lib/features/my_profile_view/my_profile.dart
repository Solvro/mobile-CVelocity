import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/my_big_icon_btn.dart';
import '../../widgets/my_error_widget.dart';
import '../profile-preview-view/models/cv.dart';
import '../profile-preview-view/profile_preview_view.dart';
import '../settings-view/data/cv_repo.dart';
import '../settings-view/settings_view.dart';

class MyProfileView extends ConsumerWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCv = ref.watch(cvRepositoryProvider);
    return switch (myCv) {
      AsyncData(:final Cv value) => ProfilePreviewView(
          value,
          isDetailView: true,
          actions: [
            ByBigIconButton(
              iconData: Icons.settings,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsView(cv: value)));
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
      AsyncError(:final error) => SimpleMyErrorWidget(error),
      _ => const CircularProgressIndicator(),
    };
  }
}
