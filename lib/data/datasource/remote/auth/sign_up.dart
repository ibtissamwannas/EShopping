import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLinkApi.signUp, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
