import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData(String search) async {
    var response = await crud.postData(AppLinkApi.search, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }
}
