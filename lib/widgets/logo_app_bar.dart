
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LogoAppBar extends AppBar {
  LogoAppBar(
    BuildContext context, {
    super.key,
  }) : super(
          title: const AppBarLogo(),
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: CVColors.floralWhite,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
        );
}

class AppBarLogo extends StatelessWidget {
  
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: Placeholder(),
          ),
          ShadAvatar(
            'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
            placeholder: Text('CN'),
          ),
        ],
      ),
    );
  }
}