import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';

import '../../../theme/app_theme.dart';

class Desc extends StatelessWidget {
  const Desc(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorTheme.jet,
      child: ListTile(
        title: ReadMoreText(
          text,
          numLines: 5,
          readMoreText: 'Czytaj więcej',
          readLessText: 'Czytaj mniej ',
          style: context.textTheme.title.copyWith(height: 1.5),
          readMoreTextStyle: context.textTheme.coloredTitle,
          readMoreIconColor: context.colorTheme.lightGrey,
        ),
      ),
    );
  }
}
