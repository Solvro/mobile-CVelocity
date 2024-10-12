import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth_view/presentation/auth_root.dart';
import 'features/bottom-nav-bar/bottom_nav_bar.dart';
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
      home: const AuthRootView(),
    );
  }
}

class LoggedRoot extends StatelessWidget {
  const LoggedRoot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        MainWidget(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: MyBottomNavBar(),
        ),
      ],
    );
  }
}
