import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class MyTag extends StatelessWidget {
  const MyTag(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        side: BorderSide.none,
        color: WidgetStatePropertyAll(context.colorTheme.indigoLight),
        label: Text(
          text,
          style: context.textTheme.title,
        ),
      ),
    );
  }
}
