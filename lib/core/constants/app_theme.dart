import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeEnglish = ThemeData(
  textTheme: TextTheme(
      headline1:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.black),
      headline2:  TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: Colors.black),
      subtitle1:  TextStyle(height: 2, color: AppColor.lightGrey,fontSize: 14),
      bodyText1:  TextStyle(color: AppColor.textGrey,fontSize: 17),
      headline6: TextStyle(fontSize: 18,color: Colors.black)
  ),
);

ThemeData themeArabic = ThemeData(
  textTheme: TextTheme(
      headline1:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.black),
      headline2:  TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: Colors.black),
      subtitle1:  TextStyle(height: 2, color: AppColor.lightGrey,fontSize: 14),
      bodyText1:  TextStyle(color: AppColor.textGrey,fontSize: 17),
      headline6: TextStyle(fontSize: 18,color: Colors.black)
  ),
);