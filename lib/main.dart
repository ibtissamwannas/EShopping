import 'package:e_shopping/core/localization/change_local.dart';
import 'package:e_shopping/core/localization/translation.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/routes.dart';
import 'package:e_shopping/view/screens/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller =  Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTraslations(),
      title: 'EShopping',
      theme: ThemeData(
        primaryColor: AppColor.backgroundGreyColor,
        textTheme: const TextTheme(
          headline1:  TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.black),
          headline2:  TextStyle(fontWeight: FontWeight.bold, fontSize: 26,color: Colors.black),
          bodyText1:  TextStyle(height: 2, color: AppColor.lightGrey,fontSize: 15),
          bodyText2:  TextStyle(color: AppColor.textGrey,fontSize: 17),
        ),
      ),
      home: const Language(),
      routes: route,
      locale: controller.language,
    );
  }
}
