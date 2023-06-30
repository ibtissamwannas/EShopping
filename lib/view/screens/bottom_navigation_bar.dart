import 'package:e_shopping/controller/home/navigation_bar_controller.dart';
import 'package:e_shopping/view/widgets/home/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(bottomNavigationBarControllerImp());
    return GetBuilder<bottomNavigationBarControllerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: CustomeAppBar(),
        body: controller.listPage.elementAt(
          controller.currentpage,
        ),
      ),
    );
  }
}
