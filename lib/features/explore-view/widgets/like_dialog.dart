import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class LikeDialog extends StatelessWidget {
  const LikeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.green.withOpacity(0.4),
        ),
        Center(
          child: Icon(
            Icons.favorite,
            size: 40,
            color: context.colorTheme.indigoDark,
          ),
        )
      ],
    );
  }
}
