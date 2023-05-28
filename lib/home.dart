import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("ok"),
      ),
      body: Column(
        children: [Text(controller.username ?? "sam")],
      ),
    );
  }
}
