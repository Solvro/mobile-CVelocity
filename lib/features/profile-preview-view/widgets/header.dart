import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class Header extends StatelessWidget {
  const Header(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: context.textTheme.headline,
      ),
    );
  }
}
