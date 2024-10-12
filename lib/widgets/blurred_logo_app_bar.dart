import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'logo.dart';
import 'profile_avatar.dart';

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
