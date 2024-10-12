import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'logo.dart';
import 'profile_avatar.dart';

class LogoAppBar extends AppBar {
  LogoAppBar(
    BuildContext context, {
    bool implyActions = true,
    super.key,
  }) : super(
          title: AppBarLogo(
            implyActions: implyActions,
          ),
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor:
              implyActions ? context.colorTheme.jet : Colors.transparent,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        );
}

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key, required this.implyActions});
  final bool implyActions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CVLogo(),
          if (implyActions) const ProfileAvatar(),
        ],
      ),
    );
  }
}
