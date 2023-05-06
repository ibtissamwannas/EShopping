import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinkApi.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
