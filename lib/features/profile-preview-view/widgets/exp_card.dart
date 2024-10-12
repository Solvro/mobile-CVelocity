import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../models/cv.dart';

class ExpCard extends StatelessWidget {
  const ExpCard(this.experience, {super.key});
  final Experience experience;
  @override
  Widget build(BuildContext context) {
    return _Card(
      position: experience.position,
      company: experience.company,
      duration: "${experience.duration}years",
    );
  }
}

class EduCard extends StatelessWidget {
  const EduCard(this.edu, {super.key});
  final Education edu;

  @override
  Widget build(BuildContext context) {
    return _Card(
      position: edu.institution,
      company: edu.degree,
      duration: edu.year.toString(),
    );
  }
}

class _Card extends StatelessWidget {
  final String position;
  final String company;
  final String duration;

  const _Card({
    required this.position,
    required this.company,
    required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorTheme.jet,
      child: ListTile(
        title: Text(
          position,
          style: context.textTheme.smallBoldText,
        ),
        subtitle: Text(
          company,
          style: context.textTheme.smallBoldText,
        ),
        trailing: Text(
          duration,
          style: context.textTheme.smallBoldText,
        ),
      ),
    );
  }
}
