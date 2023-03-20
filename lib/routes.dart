import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/view/screens/auth/login.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> route = {
  AppRoutes.login: (context) => Login(),
};
