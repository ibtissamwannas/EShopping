import 'package:e_shopping/controller/home_screen_controller.dart';
import 'package:e_shopping/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CustomeAppBar(),
        body: controller.listPage.elementAt(
          controller.currentpage,
        ),
      ),
    );
  }
}
