import 'package:flutter/material.dart';

import 'features/profile-preview-view/profile_preview_view.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: const [AppTheme()],
      ),
      home: const ProfilePreviewView(),
    );
  }
}
