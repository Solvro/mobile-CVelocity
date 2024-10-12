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
  TextStyle get smallBoldText;
  TextStyle get mediumBoldText;

  @override
  AppTextTheme copyWith({
    TextStyle? headline,
    TextStyle? smallText,
    TextStyle? smallBoldText,
    TextStyle? mediumBoldText,
  }) {
    return AppTextTheme(
      headline: headline ?? this.headline,
      smallText: smallText ?? this.smallText,
      smallBoldText: smallBoldText ?? this.smallBoldText,
      mediumBoldText: mediumBoldText ?? this.mediumBoldText,
    );
  }

  @override
  AppTextTheme lerp(covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this as AppTextTheme;
    return AppTextTheme(
      headline: TextStyle.lerp(headline, other.headline, t)!,
      smallText: TextStyle.lerp(smallText, other.smallText, t)!,
      smallBoldText: TextStyle.lerp(smallBoldText, other.smallBoldText, t)!,
      mediumBoldText: TextStyle.lerp(mediumBoldText, other.mediumBoldText, t)!,
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
                .equals(smallBoldText, other.smallBoldText) &&
            const DeepCollectionEquality()
                .equals(mediumBoldText, other.mediumBoldText));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(headline),
      const DeepCollectionEquality().hash(smallText),
      const DeepCollectionEquality().hash(smallBoldText),
      const DeepCollectionEquality().hash(mediumBoldText),
    );
  }
}
