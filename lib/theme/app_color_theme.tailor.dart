// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_color_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorThemeTailorMixin on ThemeExtension<AppColorTheme> {
  Color get floralWhite;
  Color get richBlack;
  Color get caribbeanGreen;
  Color get orangeWheel;
  Color get siennaBrown;
  Color get platinumLightGrey;
  Color get burgundyRed;

  @override
  AppColorTheme copyWith({
    Color? floralWhite,
    Color? richBlack,
    Color? caribbeanGreen,
    Color? orangeWheel,
    Color? siennaBrown,
    Color? platinumLightGrey,
    Color? burgundyRed,
  }) {
    return AppColorTheme(
      floralWhite: floralWhite ?? this.floralWhite,
      richBlack: richBlack ?? this.richBlack,
      caribbeanGreen: caribbeanGreen ?? this.caribbeanGreen,
      orangeWheel: orangeWheel ?? this.orangeWheel,
      siennaBrown: siennaBrown ?? this.siennaBrown,
      platinumLightGrey: platinumLightGrey ?? this.platinumLightGrey,
      burgundyRed: burgundyRed ?? this.burgundyRed,
    );
  }

  @override
  AppColorTheme lerp(covariant ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) return this as AppColorTheme;
    return AppColorTheme(
      floralWhite: Color.lerp(floralWhite, other.floralWhite, t)!,
      richBlack: Color.lerp(richBlack, other.richBlack, t)!,
      caribbeanGreen: Color.lerp(caribbeanGreen, other.caribbeanGreen, t)!,
      orangeWheel: Color.lerp(orangeWheel, other.orangeWheel, t)!,
      siennaBrown: Color.lerp(siennaBrown, other.siennaBrown, t)!,
      platinumLightGrey:
          Color.lerp(platinumLightGrey, other.platinumLightGrey, t)!,
      burgundyRed: Color.lerp(burgundyRed, other.burgundyRed, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColorTheme &&
            const DeepCollectionEquality()
                .equals(floralWhite, other.floralWhite) &&
            const DeepCollectionEquality().equals(richBlack, other.richBlack) &&
            const DeepCollectionEquality()
                .equals(caribbeanGreen, other.caribbeanGreen) &&
            const DeepCollectionEquality()
                .equals(orangeWheel, other.orangeWheel) &&
            const DeepCollectionEquality()
                .equals(siennaBrown, other.siennaBrown) &&
            const DeepCollectionEquality()
                .equals(platinumLightGrey, other.platinumLightGrey) &&
            const DeepCollectionEquality()
                .equals(burgundyRed, other.burgundyRed));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(floralWhite),
      const DeepCollectionEquality().hash(richBlack),
      const DeepCollectionEquality().hash(caribbeanGreen),
      const DeepCollectionEquality().hash(orangeWheel),
      const DeepCollectionEquality().hash(siennaBrown),
      const DeepCollectionEquality().hash(platinumLightGrey),
      const DeepCollectionEquality().hash(burgundyRed),
    );
  }
}
