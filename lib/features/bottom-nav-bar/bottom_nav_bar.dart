import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/app_theme.dart';
import 'bottom_navbar_controller.dart';

class MyBottomNavBar extends ConsumerWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(bottomNavbarControllerProvider);

    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.colorTheme.onyx.withOpacity(0.9),
        borderRadius: BorderRadius.circular(56),
      ),
      child: ClipRRect(
        child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 2.5,
              sigmaY: 2.5,
            ),
            child: Center(
              child: BottomNavigationBar(
                currentIndex: activeTab.index,
                onTap: (value) => ref
                    .read(bottomNavbarControllerProvider.notifier)
                    .setTab(BottomNavbarEnum.values[value]),
                items: [
                  ...BottomNavbarEnum.values.map((e) {
                    return BottomNavigationBarItem(
                      icon: Center(
                        child: Icon(
                          e.icon,
                          size: 40,
                        ),
                      ),
                      label: e.label,
                    );
                  }),
                ],
                selectedItemColor: context.colorTheme.indigoLight,
                unselectedItemColor: context.colorTheme.lightGrey,
                iconSize: 40,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            )),
      ),
    ));
  }
}
