import 'package:e_shopping/data/model/cart_model.dart';
import 'package:e_shopping/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/my_services.dart';
import '../../data/datasource/remote/cart/add_cart_data.dart';
import '../../data/datasource/remote/coupon.dart';
import '../../view/widgets/snackbars/snackbar.dart';

abstract class CartController extends GetxController {
  removeCart(itemId);
  addCart(itemId);
}

class CartControllerImp extends CartController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  Map isFavorite = {};
  int allItemsCount = 0;
  String allPriceCount = "";
  late TextEditingController controller;
  CheckCouponData checkCouponData = CheckCouponData(Get.find());
  CouponModel? model;
  double discount = 0;
  String? name;

  onPress() async {
    var response = await checkCouponData.getData(controller.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      update();
      if (response["status"] == "success") {
        Map<String, dynamic> dataCoupon = response["data"];
        model = CouponModel.fromJson(dataCoupon);
        discount = double.parse(model!.couponDiscount.toString());
        name = model!.couponName.toString();
        update();
      } else {
        discount = 0;
        name = null;
        update();
      }
    }
  }

  double getTotalPrice() {
    if (allPriceCount.isEmpty) {
      return 0.0;
    }

    String cleanedPrice = allPriceCount.replaceAll(RegExp(r'[^\d.]'), '');

    try {
      double totalPrice = double.parse(cleanedPrice);
      double discountedAmount = totalPrice * (discount / 100);
      double discountedPrice = totalPrice - discountedAmount;
      return discountedPrice;
    } catch (e) {
      print("Error parsing double: $e");
      return 0.0;
    }
  }

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

  cardView() async {
    print("fsjdfhjdshfkldsjhfkdsjfkds");
    var response = await cartData.getCards(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List resposeData = response["dataCart"];
        print(resposeData);
        Map priceAndCountResponso = response["countprice"];
        data.clear();
        data.addAll(resposeData.map((e) => CartModel.fromJson(e)));
        allItemsCount =
            int.parse(priceAndCountResponso["totalCount"].toString());
        double totalPrice = priceAndCountResponso["totalprice"];
        String numberAsString = totalPrice.toString();
        int dotIndex = numberAsString.indexOf('.');

        if (dotIndex != -1) {
          allPriceCount = numberAsString.substring(0, dotIndex);
        } else {
          allPriceCount = numberAsString;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshCardCount() {
    allItemsCount = 0;
    allPriceCount;
    data.clear();
    cardView();
    update();
  }

  @override
  void onInit() {
    controller = TextEditingController();
    cardView();
    super.onInit();
  }
}
