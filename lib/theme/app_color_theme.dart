import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';

part 'app_color_theme.tailor.dart';

@tailorMixinComponent
class AppColorTheme extends ThemeExtension<AppColorTheme>
    with _$AppColorThemeTailorMixin {
  const AppColorTheme(
      {this.indigoDark = CVColors.indigoDark,
      this.indigoLight = CVColors.indigoLight,
      this.russianViolet = CVColors.russianViolet,
      this.onyx = CVColors.onyx,
      this.lightGrey = CVColors.lightGrey});

  @override
  final Color indigoLight;
  @override
  final Color indigoDark;
  @override
  final Color russianViolet;
  @override
  final Color onyx;
  @override
  final Color lightGrey;
}
