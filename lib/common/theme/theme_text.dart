import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/common/theme/theme_colour.dart';
import 'package:news_app/common/theme/theme_sizes.dart';
import 'package:news_app/utils/size_utils.dart';

class ThemeText {
  ThemeText._();

  static TextTheme get _robotoTheme => GoogleFonts.robotoCondensedTextTheme();

  static TextStyle? get _headline6 => _robotoTheme.headline6?.copyWith(
        fontSize: ThemeSizes.dimen_20.sp,
        color: ThemeColour.selectedColour,
      );

  static TextStyle? get _headline5 => _robotoTheme.headline5?.copyWith(
        fontSize: ThemeSizes.dimen_24.sp,
        color: ThemeColour.selectedColour,
      );

  static TextStyle? get subtitle1 => _robotoTheme.subtitle1?.copyWith(
        fontSize: ThemeSizes.dimen_16.sp,
        color: ThemeColour.selectedColour,
      );

  static TextStyle? get _button => _robotoTheme.button?.copyWith(
        fontSize: ThemeSizes.dimen_14.sp,
        color: ThemeColour.selectedColour,
      );

  static TextStyle? get bodyText2 => _robotoTheme.bodyText2?.copyWith(
        color: ThemeColour.selectedColour,
        fontSize: ThemeSizes.dimen_14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _caption => _robotoTheme.caption?.copyWith(
        color: ThemeColour.selectedColour,
        fontSize: ThemeSizes.dimen_14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static getTextTheme() => TextTheme(
        headline5: _headline5,
        headline6: _headline6,
        subtitle1: subtitle1,
        bodyText2: bodyText2,
        button: _button,
        caption: _caption,
      );
}
