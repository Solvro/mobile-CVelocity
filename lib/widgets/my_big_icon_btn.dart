import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ByBigIconButton extends StatelessWidget {
  const ByBigIconButton(
      {super.key, required this.iconData, this.onPressed});
  final IconData iconData;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorTheme.onyx.withOpacity(0.7),
      shape: const CircleBorder(),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
