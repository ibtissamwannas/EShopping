import 'package:get/get.dart';
import 'package:e_shopping/core/services/my_services.dart';
import '../../core/classes/status_request.dart';
import '../core/constants/router_name.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/favorite.dart';
import '../data/datasource/remote/get_address_controller.dart';
import '../data/datasource/remote/orders_checkout.dart';
import '../data/model/address_model.dart';

abstract class CheckOutController extends GetxController {}

class CheckOutControllerImp extends CheckOutController {
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isDelivery = false;
  bool isCash = false;
  String? paymentmethod;
  String? deliveryType;
  String? addressid = "0";
  AddressData addressData = AddressData(Get.find());
  OrderCheckoutData orderCheckoutData = OrderCheckoutData(Get.find());
  List<AddressModelData> data = [];
  String? priceOrders;
  String? couponId;
  String? discount;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddressData(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List d = response["data"];
        data.addAll(d.map((e) => AddressModelData.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  sendCheckout() async {
    if (paymentmethod == null) {
      Get.snackbar("error", "payment can't be null");
    } else if (deliveryType == null) {
      Get.snackbar("error", "delivery can't be null");
    } else {
      var response = await orderCheckoutData.orderCheckoutData(
        myServices.sharedPreferences.getInt("id").toString(),
        addressid.toString(),
        deliveryType == "delivery" ? '0' : '1',
        "10",
        priceOrders.toString(),
        couponId.toString(),
        paymentmethod == "cash" ? "0" : "1",
        discount.toString(),
      );
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.snackbar("sucess", "order added");
          Get.offAllNamed(AppRoutes.home);
        } else {
          statusRequest = StatusRequest.none;
          Get.snackbar("error", "please try again");
        }
      }
    }
    update();
  }

  choosePaymentMethod(String val) {
    paymentmethod = val;
    update();
  }

  chooseDeliveryMethod(String val) {
    deliveryType = val;
    update();
  }

  chooseAddressMethod(String val) {
    addressid = val;
    update();
  }

  @override
  void onInit() {
    priceOrders = Get.arguments["price_order"];
    couponId = Get.arguments["coupon_id"];
    discount = Get.arguments["discount"];
    getData();
    super.onInit();
  }
}
