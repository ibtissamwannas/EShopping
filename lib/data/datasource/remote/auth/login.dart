import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLinkApi.logIn, {
      "email": email,
      "password": password,
    });
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
