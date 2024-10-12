import 'package:cvelocity/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/bottom-nav-bar/bottom_navbar_controller.dart';
import 'features/bottom-nav-bar/main_widget.dart';
import 'theme/app_theme.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: ThemeData(extensions: const [AppTheme()]),
        home: const Stack(
          children: [
            MainWidget(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MyBottomNavBar(),
            ),
          ],
        ));
  }
}

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
