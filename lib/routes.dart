import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/middleware/my_middleware.dart';
import 'package:e_shopping/test.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/forget_password.dart';
import 'package:e_shopping/view/screens/auth/login.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/reset_password.dart';
import 'package:e_shopping/view/screens/auth/sign_up.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/success_reset_password.dart';
import 'package:e_shopping/view/screens/auth/success_sign_up.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/verify_code.dart';
import 'package:e_shopping/view/screens/auth/verify_code_sign_up.dart';
import 'package:e_shopping/view/screens/language.dart';
import 'package:e_shopping/view/screens/onboarding.dart';
import 'package:e_shopping/view/test_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => TestView(),
  // ),
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.onBoarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signUp, page: () => SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => VerifyCode()),
  GetPage(
      name: AppRoutes.successResetPassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoutes.verifyCodeSignUp, page: () => VerifyCodeSignUp()),
];
