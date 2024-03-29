import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/classes/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/my_services.dart';
import '../data/datasource/remote/cart/add_cart_data.dart';
import '../data/model/cart_model.dart';
import '../view/widgets/snackbars/snackbar.dart';

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
  int count = 0;

  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  addCart(itemId) async {
    var response = await cartData.addCartData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.showSnackbar(
          SnackBarUI.SuccessSnackbar(
            message: 'The item added to the cart',
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeCart(itemId) async {
    var response = await cartData.removeCartData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.showSnackbar(
          SnackBarUI.SuccessSnackbar(
            message: 'The item removed to the cart',
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void toggleExpand() {
    isExpanded = !isExpanded;
    update();
  }

  void incrementQuantity() {
    count++;
    update();
  }

  void decrementQuantity() {
    if (count > 0) {
      count--;
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

  getCountCart(itemId) async {
    var response = await cartData.getCountCartData(
      myServices.sharedPreferences.getInt("id").toString(),
      itemId.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int count = 0;
        count = response["data"];
        return count;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initData() async {
    itemsModel = Get.arguments['itemsModel'];
    count = await getCountCart(itemsModel.itemId);
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
