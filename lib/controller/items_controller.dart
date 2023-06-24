import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCategoryIndex(val);
  void scrollToTop();
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int selectedCat = 0;
  final ScrollController scrollController = ScrollController();
  bool showFloatingButton = false;
  double previousScrollPosition = 0.0;
  bool hideFloatingButton = false;
  bool isScrolling = false;

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
  }

  @override
  changeCategoryIndex(val) {
    selectedCat = val;
    update();
  }

  @override
  void scrollToTop() {
    isScrolling = true; // Set the flag to indicate scrolling
    update();
    scrollController
        .animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    )
        .whenComplete(() {
      isScrolling = false; // Reset the flag after scrolling is complete
      update();
      showFloatingButton =
          false; // Hide the floating button after scrolling to top
      update();
    });
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!showFloatingButton && !isScrolling) {
        showFloatingButton = true;
        update();
      }
    } else {
      if (showFloatingButton) {
        showFloatingButton = false;
        update();
      }
    }
  }
}
