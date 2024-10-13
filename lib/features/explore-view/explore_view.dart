import 'package:cvelocity/features/explore-view/mock.dart';
import 'package:flutter/material.dart';

import '../../widgets/profile_avatar.dart';
import '../profile-preview-view/models/cv.dart';
import '../profile-preview-view/profile_preview_view.dart';
import '../skills/skill_model.dart';
import '../tags/tag_model.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < companyCVMocks.length; i++)
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
            child: ProfilePreviewView(
                companyCVMocks[i],
                actions: const [ProfileAvatar()],
                
                ),
          )
      ],
    );
  }
}
