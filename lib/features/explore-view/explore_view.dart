import 'package:flutter/material.dart';

import '../profile-preview-view/profile_preview_view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 100; i++)
          Dismissible(
            key: Key(i.toString()),
            secondaryBackground: const ColoredBox(
              color: Colors.red,
              child: Icon(
                Icons.cancel,
                size: 100,
                color: Colors.white,
              ),
            ),
            background: const ColoredBox(
              color: Colors.green,
              child: Icon(
                Icons.favorite,
                size: 100,
                color: Colors.white,
              ),
            ),
            child: const ProfilePreviewView(),
          )
      ],
    );
  }
}
