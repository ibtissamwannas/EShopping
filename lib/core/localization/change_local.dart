import 'package:e_shopping/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang == "ar"){
      language = const Locale("ar");
    }else if (sharedPrefLang == "en"){
      language = const Locale("en");
    }else{
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}