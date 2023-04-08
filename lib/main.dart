import 'package:e_shopping/core/localization/change_local.dart';
import 'package:e_shopping/core/localization/translation.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/routes.dart';
import 'package:e_shopping/view/screens/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTraslations(),
      title: 'EShopping',
      theme: controller.appTheme,
      home: const Language(),
      routes: route,
      locale: controller.language,
    );
  }
}
