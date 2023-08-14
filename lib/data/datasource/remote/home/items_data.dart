import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userId) async {
    var response = await crud.postData(
      AppLinkApi.items,
      {"id": id.toString(), "user_id": userId},
    );
    return response.fold((l) => l, (r) => r);
  }
}
