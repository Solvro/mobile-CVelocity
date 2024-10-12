import 'package:cvelocity/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: context.colorTheme.jet,
        side: BorderSide(
          color: context.colorTheme.onyx,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: context.textTheme.smallText.copyWith(
          color: context.colorTheme.lightGrey,
        ),
      ),
    );
  }
}
