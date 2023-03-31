import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/view/screens/auth/login.dart';
import 'package:e_shopping/view/screens/auth/sign_up.dart';
import 'package:e_shopping/view/screens/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> route = {
  AppRoutes.login: (context) => Login(),
  AppRoutes.onBoarding: (context) => OnBoarding(),
  AppRoutes.signUp: (context) => SignUp(),
};
