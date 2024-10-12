// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_text_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppTextThemeTailorMixin on ThemeExtension<AppTextTheme> {
  TextStyle get headline;
  TextStyle get smallText;
  TextStyle get smallPomegradeText;
  TextStyle get smallBoldText;
  TextStyle get mediumBoldText;
  TextStyle get mediumGrayBoldText;

  @override
  AppTextTheme copyWith({
    TextStyle? headline,
    TextStyle? smallText,
    TextStyle? smallPomegradeText,
    TextStyle? smallBoldText,
    TextStyle? mediumBoldText,
    TextStyle? mediumGrayBoldText,
  }) {
    return AppTextTheme(
      headline: headline ?? this.headline,
      smallText: smallText ?? this.smallText,
      smallPomegradeText: smallPomegradeText ?? this.smallPomegradeText,
      smallBoldText: smallBoldText ?? this.smallBoldText,
      mediumBoldText: mediumBoldText ?? this.mediumBoldText,
      mediumGrayBoldText: mediumGrayBoldText ?? this.mediumGrayBoldText,
    );
  }

  @override
  AppTextTheme lerp(covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this as AppTextTheme;
    return AppTextTheme(
      headline: TextStyle.lerp(headline, other.headline, t)!,
      smallText: TextStyle.lerp(smallText, other.smallText, t)!,
      smallPomegradeText:
          TextStyle.lerp(smallPomegradeText, other.smallPomegradeText, t)!,
      smallBoldText: TextStyle.lerp(smallBoldText, other.smallBoldText, t)!,
      mediumBoldText: TextStyle.lerp(mediumBoldText, other.mediumBoldText, t)!,
      mediumGrayBoldText:
          TextStyle.lerp(mediumGrayBoldText, other.mediumGrayBoldText, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTextTheme &&
            const DeepCollectionEquality().equals(headline, other.headline) &&
            const DeepCollectionEquality().equals(smallText, other.smallText) &&
            const DeepCollectionEquality()
                .equals(smallPomegradeText, other.smallPomegradeText) &&
            const DeepCollectionEquality()
                .equals(smallBoldText, other.smallBoldText) &&
            const DeepCollectionEquality()
                .equals(mediumBoldText, other.mediumBoldText) &&
            const DeepCollectionEquality()
                .equals(mediumGrayBoldText, other.mediumGrayBoldText));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headline),
      const DeepCollectionEquality().hash(smallText),
      const DeepCollectionEquality().hash(smallPomegradeText),
      const DeepCollectionEquality().hash(smallBoldText),
      const DeepCollectionEquality().hash(mediumBoldText),
      const DeepCollectionEquality().hash(mediumGrayBoldText),
    );
  }
}
