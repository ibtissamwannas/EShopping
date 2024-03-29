import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingContainer extends GetxController {
  goNext();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingContainer {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  goNext() {
    currentPage++;
    if (currentPage >= onBoardingList.length) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 90),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
