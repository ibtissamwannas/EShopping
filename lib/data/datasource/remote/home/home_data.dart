import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinkApi.homepage, {});
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
