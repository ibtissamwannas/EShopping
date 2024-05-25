import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class AllOrdersData {
  Crud crud;
  AllOrdersData(this.crud);
  allOrderdData(String userId) async {
    var response = await crud.postData(AppLinkApi.allorders, {
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  archieveOrdersData(String userId) async {
    var response =
        await crud.postData(AppLinkApi.archieveorders, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }

  detailsOrderData(String id) async {
    var response = await crud.postData(AppLinkApi.orderDetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String id) async {
    var response = await crud.postData(AppLinkApi.deleteOrder, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  pendingOrder(String id) async {
    var response = await crud.postData(AppLinkApi.pendingOrders, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
