import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';

part 'app_color_theme.tailor.dart';

@tailorMixinComponent
class AppColorTheme extends ThemeExtension<AppColorTheme>
    with _$AppColorThemeTailorMixin {
  const AppColorTheme({
    this.floralWhite = CVColors.floralWhite,
    this.richBlack = CVColors.richBlack,
    this.caribbeanGreen = CVColors.caribbeanGreen,
    this.orangeWheel = CVColors.orangeWheel,
    this.siennaBrown = CVColors.siennaBrown,
    this.platinumLightGrey = CVColors.platinumLightGrey,
    this.burgundyRed = CVColors.burgundyRed
  });

  @override
  final Color floralWhite;

  @override
  final Color richBlack;

  @override
  final Color caribbeanGreen;

  @override
  final Color orangeWheel;

  @override
  final Color siennaBrown;

  @override
  final Color platinumLightGrey;

  @override
  final Color burgundyRed;
}