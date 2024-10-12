// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_color_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorThemeTailorMixin on ThemeExtension<AppColorTheme> {
  Color get indigoLight;
  Color get indigoDark;
  Color get russianViolet;
  Color get onyx;
  Color get jet;
  Color get lightGrey;

  @override
  AppColorTheme copyWith({
    Color? indigoLight,
    Color? indigoDark,
    Color? russianViolet,
    Color? onyx,
    Color? jet,
    Color? lightGrey,
  }) {
    return AppColorTheme(
      indigoLight: indigoLight ?? this.indigoLight,
      indigoDark: indigoDark ?? this.indigoDark,
      russianViolet: russianViolet ?? this.russianViolet,
      onyx: onyx ?? this.onyx,
      jet: jet ?? this.jet,
      lightGrey: lightGrey ?? this.lightGrey,
    );
  }

  @override
  AppColorTheme lerp(covariant ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) return this as AppColorTheme;
    return AppColorTheme(
      indigoLight: Color.lerp(indigoLight, other.indigoLight, t)!,
      indigoDark: Color.lerp(indigoDark, other.indigoDark, t)!,
      russianViolet: Color.lerp(russianViolet, other.russianViolet, t)!,
      onyx: Color.lerp(onyx, other.onyx, t)!,
      jet: Color.lerp(jet, other.jet, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColorTheme &&
            const DeepCollectionEquality()
                .equals(indigoLight, other.indigoLight) &&
            const DeepCollectionEquality()
                .equals(indigoDark, other.indigoDark) &&
            const DeepCollectionEquality()
                .equals(russianViolet, other.russianViolet) &&
            const DeepCollectionEquality().equals(onyx, other.onyx) &&
            const DeepCollectionEquality().equals(jet, other.jet) &&
            const DeepCollectionEquality().equals(lightGrey, other.lightGrey));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(indigoLight),
      const DeepCollectionEquality().hash(indigoDark),
      const DeepCollectionEquality().hash(russianViolet),
      const DeepCollectionEquality().hash(onyx),
      const DeepCollectionEquality().hash(jet),
      const DeepCollectionEquality().hash(lightGrey),
    );
  }
}
