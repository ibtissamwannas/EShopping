import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetails extends GetxController {
  initData();
  setSelectedColorIndex(int index);
  incrementQuantity();
  decrementQuantity();
}

class ProductDetailsImp extends ProductDetails {
  late ItemsModel itemsModel;
  int selectedColorIndex = 0;
  int productQuantity = 1;
  bool isExpanded = false;

  void toggleExpand() {
    isExpanded = !isExpanded;
    update();
  }

  void incrementQuantity() {
    productQuantity++;
    update();
  }

  void decrementQuantity() {
    if (productQuantity > 1) {
      productQuantity--;
      update();
    }
  }

  List<Map<String, dynamic>> colorData = [
    {"name": Colors.red, "id": 1, "active": 0},
    {"name": Colors.yellow, "id": 2, "active": 0},
    {"name": Colors.blue, "id": 3, "active": 1},
  ];

  void setSelectedColorIndex(index) {
    selectedColorIndex = index;
    update();
  }

  @override
  initData() {
    itemsModel = Get.arguments['itemsModel'];
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
