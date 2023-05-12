import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLinkApi.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
