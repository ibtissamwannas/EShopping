import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCartData(String userId, String itemId) async {
    var response = await crud
        .postData(AppLinkApi.cartAdd, {"user_id": userId, "items_id": itemId});
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  removeCartData(String userId, String itemId) async {
    var response = await crud.postData(
        AppLinkApi.cardRemove, {"user_id": userId, "items_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  getCountCartData(String userId, String itemId) async {
    var response = await crud
        .postData(AppLinkApi.getCount, {"user_id": userId, "items_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  getCards(String userId) async {
    var response =
        await crud.postData(AppLinkApi.cartView, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
