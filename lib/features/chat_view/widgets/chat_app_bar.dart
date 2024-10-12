import 'package:cvelocity/theme/app_theme.dart';
import 'package:cvelocity/widgets/logo.dart';
import 'package:cvelocity/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends AppBar {
  ChatAppBar(
    BuildContext context, {
    required VoidCallback onPressed,
    super.key, required String title,
  }) : super(
          title: AppBarChat(
            onPressed: onPressed,
            title: title,
          ),
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: context.colorTheme.jet,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        );
}

class AppBarChat extends StatelessWidget {
  const AppBarChat({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )
          ),
          const ProfileAvatar(),
          const SizedBox(width: 16),
          Text(title, style: context.textTheme.headline),
        ],
      ),
    );
  }
}
