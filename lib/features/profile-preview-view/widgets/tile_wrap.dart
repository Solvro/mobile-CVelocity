import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class TileWrap extends StatelessWidget {
  const TileWrap({
    super.key,
    required this.children,
    required this.title,
  });
  final List<Widget> children;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: context.textTheme.headline,
        ),
      ),
      subtitle: Wrap(
        children: children,
      ),
    );
  }
}
