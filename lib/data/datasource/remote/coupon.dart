import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class CheckCouponData {
  Crud crud;
  CheckCouponData(this.crud);
  getData(String coupon) async {
    var response = await crud.postData(
      AppLinkApi.checkCoupon,
      {
        "coupon_name": coupon,
      },
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
