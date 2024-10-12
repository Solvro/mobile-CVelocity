import 'package:cvelocity/colors.dart';
import 'package:cvelocity/features/main_widget.dart';
import 'package:cvelocity/features/bottom_navbar_controller.dart';
import 'package:cvelocity/widgets/logo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: Scaffold(
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
      selectedItemColor: CVColors.orangeWheel,
      iconSize: 40,
    );
  }
}
