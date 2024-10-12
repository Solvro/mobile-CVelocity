import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/bottom-nav-bar/bottom_navbar_controller.dart';
import 'features/bottom-nav-bar/main_widget.dart';
import 'theme/app_theme.dart';

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
      home: const Scaffold(
        body: MainWidget(),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}

class MyBottomNavBar extends ConsumerWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(bottomNavbarControllerProvider);
    return BottomNavigationBar(
      currentIndex: activeTab.index,
      onTap: (value) => ref
          .read(bottomNavbarControllerProvider.notifier)
          .setTab(BottomNavbarEnum.values[value]),
      items: [
        ...BottomNavbarEnum.values.map(
          (e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.label,
          ),
        )
      ],
      selectedItemColor: context.colorTheme.indigoDark,
      iconSize: 40,
    );
  }
}
