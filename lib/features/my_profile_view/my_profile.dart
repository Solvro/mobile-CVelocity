import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/my_big_icon_btn.dart';
import '../../widgets/my_error_widget.dart';
import '../auth_view/business/auth_service.dart';
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
            PopupMenuButton(
                color: Colors.transparent,
                elevation: 0,
                offset: const Offset(0, 75),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Transform.translate(
                          offset: const Offset(28, 0),
                          child: Consumer(
                            builder: (context, ref, child) => ByBigIconButton(
                              iconData: Icons.logout,
                              onPressed: () async {
                                ref.read(authServiceProvider.notifier).logout();
                                Navigator.of(context)
                                    .popUntil((r) => r.isFirst);
                              },
                            ),
                          )),
                    ),
                    PopupMenuItem(
                      child: Transform.translate(
                        offset: const Offset(28, 0),
                        child: ByBigIconButton(
                          iconData: Icons.edit,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SettingsView(cv: value)));
                          },
                        ),
                      ),
                    ),
                  ];
                },
                child: const ByBigIconButton(
                  iconData: Icons.settings,
                )),
            const SizedBox(width: 10),
          ],
        ),
      AsyncError(:final error) => SimpleMyErrorWidget(error),
      _ => const CircularProgressIndicator(),
    };
  }
}
