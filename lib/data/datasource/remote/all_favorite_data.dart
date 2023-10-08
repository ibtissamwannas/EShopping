import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class AllFavoriteData {
  Crud crud;
  AllFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(
      AppLinkApi.allFavorite,
      {
        "user_id": id,
      },
    );
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
