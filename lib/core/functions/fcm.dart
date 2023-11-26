import 'package:e_shopping/controller/all_orders_controller.dart';
import 'package:e_shopping/controller/notification_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmConfig() {
  FirebaseMessaging.onMessage.listen((event) {
    print("=========================notification=============================");
    print(event.notification!.title);
    print(event.notification!.body);
    FlutterRingtonePlayer.play(
      android: AndroidSounds.ringtone,
      ios: IosSounds.sentMessage,
      looping: false, // Android only - API >= 28
      volume: 0.1, // Android only - API >= 28
      asAlarm: false, // Android only - all APIs
    );
    Get.snackbar(event.notification!.title!, event.notification!.body!);
    refreshPageNotification(event.data);
  });
}

refreshPageNotification(data) {
  print(Get.currentRoute);
  if (Get.currentRoute == "/allorder" && data["pagename"] == "orderRefresh") {
    print("==========================================================");
    AllOrdersControllerImp controller = Get.find();
    controller.onInit();
    notificationControllerImp controller2 = Get.find();
    controller2.onInit();
  }
}
