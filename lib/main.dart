import 'package:cvelocity/colors.dart';
import 'package:cvelocity/widgets/logo_app_bar.dart';
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
            primaryForeground: CVColors.floralWhite,
            secondary: CVColors.siennaBrown,
            secondaryForeground: CVColors.richBlack,
            muted: CVColors.platinumLightGrey,
            mutedForeground: CVColors.richBlack,
            accent: CVColors.siennaBrown,
            accentForeground: CVColors.floralWhite,
            destructive: CVColors.burgundyRed,
            destructiveForeground: CVColors.floralWhite,
            border: CVColors.siennaBrown,
            input: CVColors.richBlack,
            ring: Colors.transparent,
            selection: CVColors.platinumLightGrey,
          ),
          inputTheme: ShadInputTheme(
            decoration: ShadDecoration(
              border: ShadBorder.all(color: CVColors.platinumLightGrey),
              focusedBorder: ShadBorder.all(color: CVColors.orangeWheel),
              errorBorder: ShadBorder.all(),
            ),
          )),
      home: Scaffold(
        appBar: LogoAppBar(context),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShadButton(
                child: const Text('Primary'),
                onPressed: () {},
              ),
              ShadButton.outline(
                child: const Text('Add to calendar'),
                onPressed: () {
                  ShadToaster.of(context).show(
                    ShadToast(
                      title: const Text('Scheduled: Catch up'),
                      description:
                          const Text('Friday, February 10, 2023 at 5:57 PM'),
                      action: ShadButton.outline(
                        child: const Text('Undo'),
                        onPressed: () => ShadToaster.of(context).hide(),
                      ),
                    ),
                  );
                },
              ),
              ShadInput(
                placeholder: const Text('Password'),
                obscureText: false,
                prefix: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ShadImage.square(size: 16, LucideIcons.lock),
                ),
                suffix: ShadButton(
                  width: 24,
                  height: 24,
                  padding: EdgeInsets.zero,
                  icon: const ShadImage.square(
                    size: 16,
                    false ? LucideIcons.eyeOff : LucideIcons.eye,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
