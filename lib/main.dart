import 'package:cvelocity/colors.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadColorScheme(
          background: CVColors.floralWhite,
          foreground: CVColors.richBlack,
          card: CVColors.siennaBrown,
          cardForeground: CVColors.richBlack,
          popover: CVColors.siennaBrown,
          popoverForeground: CVColors.richBlack,
          primary: CVColors.orangeWheel,
          primaryForeground: CVColors.richBlack,
          secondary: CVColors.caribbeanGreen,
          secondaryForeground: CVColors.richBlack,
          muted: CVColors.platinumLightGrey,
          mutedForeground: CVColors.richBlack,
          accent: CVColors.caribbeanGreen,
          accentForeground: CVColors.richBlack,
          destructive: CVColors.burgundyRed,
          destructiveForeground: CVColors.floralWhite,
          border: CVColors.siennaBrown,
          input: CVColors.richBlack,
          ring: CVColors.caribbeanGreen,
          selection: CVColors.caribbeanGreen,
        ),
      ),
    );
  }
}
