import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../explore-view/explore_view.dart';
import '../likes-view/likes_view.dart';
import 'bottom_navbar_controller.dart';

class MainWidget extends ConsumerWidget {
  const MainWidget({super.key});

  static const widgetMap = {
    BottomNavbarEnum.explore: ExploreView(),
    BottomNavbarEnum.likes: LikesView(),
    BottomNavbarEnum.chats: Scaffold(
      body: Center(
        child: Text("3"),
      ),
    ),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(bottomNavbarControllerProvider);
    return IndexedStack(
      index: selectedTab.index,
      children: [
        ...BottomNavbarEnum.values
            .map((e) => widgetMap[e] ?? const Placeholder())
      ],
    );
  }
}
