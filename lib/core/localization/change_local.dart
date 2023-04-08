import 'package:e_shopping/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_theme.dart';

class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic:themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
      appTheme = themeArabic;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en");
      appTheme = themeEnglish;
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}