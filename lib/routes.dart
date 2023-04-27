import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/forget_password.dart';
import 'package:e_shopping/view/screens/auth/login.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/reset_password.dart';
import 'package:e_shopping/view/screens/auth/sign_up.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/success_reset_password.dart';
import 'package:e_shopping/view/screens/auth/success_sign_up.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/verify_code.dart';
import 'package:e_shopping/view/screens/auth/verify_code_sign_up.dart';
import 'package:e_shopping/view/screens/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> route = {
  AppRoutes.login: (context) => Login(),
  AppRoutes.onBoarding: (context) => OnBoarding(),
  AppRoutes.signUp: (context) => SignUp(),
  AppRoutes.forgetPassword: (context) => ForgetPassword(),
  AppRoutes.resetPassword: (context) => ResetPassword(),
  AppRoutes.verifyCode: (context) => VerifyCode(),
  AppRoutes.successResetPassword: (context) => SuccessResetPassword(),
  AppRoutes.successSignUp: (context) => SuccessSignUp(),
  AppRoutes.verifyCodeSignUp: (context) => VerifyCodeSignUp()
};
