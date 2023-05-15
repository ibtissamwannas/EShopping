import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLinkApi.checkEmail, {
      "email": email,
    });
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
