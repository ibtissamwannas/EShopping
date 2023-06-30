import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeEnglish = ThemeData(
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      color: AppColor.textGrey,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: AppColor.textGrey,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      fontSize: 17,
      color: AppColor.textGrey,
    ),
    titleSmall: TextStyle(
      color: AppColor.textGrey,
      fontSize: 15,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 19,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 17,
      color: Colors.white,
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
      subtitle1: TextStyle(height: 2, color: AppColor.lightGrey, fontSize: 14),
      bodyText1: TextStyle(color: AppColor.textGrey, fontSize: 17),
      headline6: TextStyle(fontSize: 18, color: Colors.black)),
);
