import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: context.textTheme.smallText),
    );
  }
}
