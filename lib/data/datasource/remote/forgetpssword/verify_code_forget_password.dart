import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinkApi.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
