import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../models/experience.dart';

class ExpCard extends StatelessWidget {
  const ExpCard(this.experience, {super.key});
  final Experience experience;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorTheme.indigoDark,
      child: ListTile(
        title: Text(
          experience.jobTitle,
          style: context.textTheme.smallBoldText,
        ),
        subtitle: Text(
          experience.company,
          style: context.textTheme.smallBoldText,
        ),
        trailing: Text(
          "${experience.experience}years",
          style: context.textTheme.smallBoldText,
        ),
      ),
    );
  }
}
