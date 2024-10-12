import 'package:flutter/material.dart';

import 'colors.dart';

class BodyTextStyle extends TextStyle {
  const BodyTextStyle({
    super.fontWeight = FontWeight.w400,
    super.fontSize = 13.0,
    super.color = Colors.white,
    super.height = 1.2,
    super.shadows,
  }) : super(
          fontFamily: "Rubik",
          letterSpacing: 0,
        );
}

class BoldBodyTextStyle extends BodyTextStyle {
  const BoldBodyTextStyle({super.fontSize, super.color})
      : super(fontWeight: FontWeight.w500);
}

class HeadlineTextStyle extends BoldBodyTextStyle {
  const HeadlineTextStyle({super.color}) : super(fontSize: 19);
}

class LargeHeadlineTextStyle extends BoldBodyTextStyle {
  const LargeHeadlineTextStyle({super.color}) : super(fontSize: 27);
}

class TitleTextStyle extends BoldBodyTextStyle {
  const TitleTextStyle({super.color}) : super(fontSize: 17);
}

class ColoredTitleTextStyle extends BodyTextStyle {
  const ColoredTitleTextStyle()
      : super(fontSize: 17, color: CVColors.lightGrey);
}

class SmallBoldTextStyle extends BoldBodyTextStyle {
  const SmallBoldTextStyle({super.color}) : super(fontSize: 14);
}

class SmallTextStyle extends BodyTextStyle {
  const SmallTextStyle({super.color}) : super(fontSize: 14);
}

class MediumBoldTextStyle extends BoldBodyTextStyle {
  const MediumBoldTextStyle({super.color}) : super(fontSize: 16);
}
