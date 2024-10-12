import 'package:cvelocity/features/chats-view/chats_view.dart';
import 'package:cvelocity/theme/app_theme.dart';
import 'package:cvelocity/widgets/logo.dart';
import 'package:cvelocity/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class BlurredLogoAppBar extends AppBar {
  BlurredLogoAppBar(
    BuildContext context, {
    bool implyActions = true,
    super.key,
  }) : super(
          flexibleSpace: FlexibleSpaceBar(
            title: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: const SizedBox.expand()),
          ),
          title: AppBarLogo(
            implyActions: implyActions,
          ),
          toolbarHeight: kToolbarHeight + 25,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: context.colorTheme.onyx.withOpacity(0.8),
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        );
}

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key, required this.implyActions});
  final bool implyActions;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 48,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CVLogo(),
          ProfileAvatar(),
        ],
      ),
    );
  }
}
