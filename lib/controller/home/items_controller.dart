import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/datasource/remote/home/items_data.dart';
import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCategoryIndex(val, catVal);
  scrollToTop();
  getItems(String categoryId);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int selectedCat = 0;
  String? category;
  final ScrollController scrollController = ScrollController();
  bool showFloatingButton = false;
  double previousScrollPosition = 0.0;
  bool hideFloatingButton = false;
  bool isScrolling = false;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    category = Get.arguments["categoryId"];
  }

  @override
  changeCategoryIndex(val, catVal) {
    selectedCat = val;
    category = catVal;
    data.clear();
    getItems(category!);
    update();
  }

  @override
  getItems(categoryId) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
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

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    initialData();
    getItems(category!);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
