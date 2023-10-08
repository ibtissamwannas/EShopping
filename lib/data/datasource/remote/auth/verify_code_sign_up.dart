import 'package:e_shopping/core/classes/crud.dart';
import 'package:e_shopping/link_api.dart';

class VerifySignUpCodeData {
  Crud crud;
  VerifySignUpCodeData(this.crud);
  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLinkApi.verifyCode, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }

  resentCode(String email) async {
    var response = await crud.postData(AppLinkApi.resendCode, {
      "email": email,
    });
    return response.fold(
      (l) => l,
      (r) => r,
    );
  }
}
