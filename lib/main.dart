import 'package:e_shopping/bindings/initial_binding.dart';
import 'package:e_shopping/core/localization/change_local.dart';
import 'package:e_shopping/core/localization/translation.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

// refreshPageNotification(data) {
//   AllOrdersControllerImp controller = Get.find();
//   controller.refreshPageNotification(data);
//   notificationControllerImp controller2 = Get.find();
//   controller2.onInit();
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await initializeServices();
//   refreshPageNotification(message.data);
// }

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
      locale: controller.language,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
