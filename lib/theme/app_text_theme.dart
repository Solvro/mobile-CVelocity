import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'typography.dart';

part 'app_text_theme.tailor.dart';

@tailorMixinComponent
class AppTextTheme extends ThemeExtension<AppTextTheme>
    with _$AppTextThemeTailorMixin {
  const AppTextTheme({
    this.largeHeadline = const LargeHeadlineTextStyle(),
    // Headline 19px, w500
    this.headline = const HeadlineTextStyle(),
    // 17px
    this.title = const TitleTextStyle(),

    // SmallText 14px, w400
    this.smallText = const SmallTextStyle(),

    // SmallBoldText 14px, w500
    this.smallBoldText = const SmallBoldTextStyle(),

    // MediumBoldText 16px, w500
    this.mediumBoldText = const MediumBoldTextStyle(),
  });
  final TextStyle largeHeadline;
  @override
  final TextStyle headline;
  @override
  final TextStyle title;
  @override
  final TextStyle smallText;
  @override
  final TextStyle smallBoldText;
  @override
  final TextStyle mediumBoldText;
}
