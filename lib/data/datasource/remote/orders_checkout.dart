import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class OrderCheckoutData {
  Crud crud;
  OrderCheckoutData(this.crud);

  orderCheckoutData(
      String userId,
      String addressId,
      String type,
      String priceDevlivery,
      String ordrePrice,
      String couponId,
      String paymentMethod,
      String couponDiscount) async {
    var response = await crud.postData(AppLinkApi.checkoutOrder, {
      'user_id': userId,
      'address_id': addressId,
      'orders_type': type,
      'price_delivery': priceDevlivery,
      'order_price': ordrePrice,
      'coupon_id': couponId,
      'payment_method': paymentMethod,
      "coupon_discount": couponDiscount
    });
    return response.fold((l) => l, (r) => r);
  }
}
