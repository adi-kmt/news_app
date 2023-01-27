import 'package:flutter/material.dart';
import 'package:news_app/common/theme/theme_colour.dart';
import 'package:news_app/common/theme/theme_text.dart';

ThemeData returnTheme() => ThemeData(
      // unselectedWidgetColor: AppColor.royalBlue,
      primaryColor: ThemeColour.selectedColour,
      scaffoldBackgroundColor: ThemeColour.primaryColour,
      brightness: Brightness.light,
      cardTheme: const CardTheme(
        color: ThemeColour.secondaryColour,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: ThemeText.getTextTheme(),
      appBarTheme: const AppBarTheme(elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColour.selectedColour,
          ),
        ),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: ThemeColour.secondaryColour),
    );
