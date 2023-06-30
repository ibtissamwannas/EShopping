import 'package:e_shopping/controller/home/navigation_bar_controller.dart';
import 'package:e_shopping/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeAppBar extends GetView<bottomNavigationBarControllerImp> {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.black, // Set the color of the small line
            width: 0.1, // Adjust the thickness as needed
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.grey,
        onTap: (index) => controller.changePage(index),
        currentIndex: controller.currentpage,
        items: [
          ...List.generate(
            controller.listPage.length,
            (index) => BottomNavigationBarItem(
              icon: Icon(controller.icons[index]),
              label: controller.bottomTitle[index],
            ),
          )
        ],
      ),
    );
  }
}
