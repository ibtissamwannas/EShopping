import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class AllOrdersData {
  Crud crud;
  AllOrdersData(this.crud);
  allOrderdData(String userId) async {
    var response = await crud.postData(AppLinkApi.allorders, {
      "user_id": userId,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  archieveOrdersData(String userId, String itemId) async {
    var response = await crud.postData(
        AppLinkApi.archieveorders, {"user_id": userId, "items_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  detailsOrderData(String id) async {
    var response = await crud.postData(AppLinkApi.orderDetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
