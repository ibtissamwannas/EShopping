import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "tanbeh",
      middleText: "do you want to exit from app",
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("Yes"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("No"),
        )
      ]);
  return Future.value(true);
}
