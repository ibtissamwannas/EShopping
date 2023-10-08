import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavoriteData(String userId, String itemId) async {
    var response = await crud.postData(
        AppLinkApi.addFavorite, {"user_id": userId, "items_id": itemId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavoriteData(String userId, String itemId) async {
    var response = await crud.postData(
        AppLinkApi.removeFavorite, {"user_id": userId, "items_id": itemId});
    return response.fold((l) => l, (r) => r);
  }
}
