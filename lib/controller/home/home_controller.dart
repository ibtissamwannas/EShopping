import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/services/my_services.dart';
import 'package:e_shopping/data/datasource/remote/home/home_data.dart';
import 'package:e_shopping/data/datasource/remote/search_data.dart';
import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/functions/handling_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  onPageChanged(int index);
  goToSpecificItem(List categories, int selectedCat, String categoryId);
  goToProductDetails(itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  int? id;
  String? username;
  String? email;
  String? phonenumber;
  int current_slider = 0;
  HomeData homeData = HomeData(Get.find());
  List items = [];
  List categories = [];
  late StatusRequest statusRequest;
  SearchData searchData = SearchData(Get.find());
  late TextEditingController searchCntroller;
  bool isSearch = false;
  List<ItemsModel> itemsSearch = [];
  ItemsModel? itemsModel;

  checkval(val) {
    if (val == "") {
      isSearch = false;
      itemsSearch.clear();
    } else {
      isSearch = true;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    itemsSearch.clear();
    search();
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsModel": itemsModel});
  }

  @override
  initialData() {
    id = myServices.sharedPreferences.getInt("id");
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    phonenumber = myServices.sharedPreferences.getString("phonenumber");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToSpecificItem(categories, selectedCat, categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryId": categoryId
    });
  }

  search() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchData(searchCntroller.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        itemsSearch.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  onPageChanged(int index) {
    current_slider = index;
    update();
  }

  @override
  void onInit() {
    searchCntroller = TextEditingController();
    initialData();
    getData();
    print(statusRequest);
    super.onInit();
  }
}
