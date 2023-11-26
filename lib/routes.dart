import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/view/screens/address/add.dart';
import 'package:e_shopping/view/screens/address/add_address_two.dart';
import 'package:e_shopping/view/screens/address/edit.dart';
import 'package:e_shopping/view/screens/address/view.dart';
import 'package:e_shopping/view/screens/allorders/all_orders.dart';
import 'package:e_shopping/view/screens/allorders/archieve_orders.dart';
import 'package:e_shopping/view/screens/allorders/details.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/forget_password.dart';
import 'package:e_shopping/view/screens/auth/login.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/reset_password.dart';
import 'package:e_shopping/view/screens/auth/sign_up.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/success_reset_password.dart';
import 'package:e_shopping/view/screens/auth/success_sign_up.dart';
import 'package:e_shopping/view/screens/auth/forgetpassword/verify_code.dart';
import 'package:e_shopping/view/screens/auth/verify_code_sign_up.dart';
import 'package:e_shopping/view/screens/favorite/favorite.dart';
import 'package:e_shopping/view/screens/home/cart.dart';
import 'package:e_shopping/view/screens/home/checkout.dart';
import 'package:e_shopping/view/screens/home/items.dart';
import 'package:e_shopping/view/screens/bottom_navigation_bar.dart';
import 'package:e_shopping/view/screens/language.dart';
import 'package:e_shopping/view/screens/onboarding.dart';
import 'package:e_shopping/view/screens/product/product_details.dart';
import 'package:get/get.dart';

import 'core/middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => Language(),
    middlewares: [MyMiddleware()],
  ),
  GetPage(
    name: "/productDetails",
    page: () => ProductDetials(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => Login(),
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => OnBoarding(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => SignUp(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => ResetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoutes.successSignUp,
    page: () => SuccessSignUp(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeSignUp,
    page: () => VerifyCodeSignUp(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => bottomNavigationBar(),
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => Items(),
  ),
  GetPage(
    name: AppRoutes.favorite,
    page: () => FavoriteScreen(),
  ),
  GetPage(
    name: AppRoutes.cart,
    page: () => Cart(),
  ),
  GetPage(
    name: AppRoutes.addAddress,
    page: () => AddAddress(),
  ),
  GetPage(
    name: AppRoutes.editAddress,
    page: () => EditAddress(),
  ),
  GetPage(
    name: AppRoutes.AddressView,
    page: () => AddressView(),
  ),
  GetPage(
    name: AppRoutes.addAddressTwo,
    page: () => AddAddressTwo(),
  ),
  GetPage(
    name: AppRoutes.checkOutScreen,
    page: () => CheckOut(),
  ),
  GetPage(
    name: AppRoutes.allorder,
    page: () => AllOrders(),
  ),
  GetPage(
    name: AppRoutes.allorder,
    page: () => ArchieveOrders(),
  ),
  GetPage(
    name: AppRoutes.detailsOrder,
    page: () => Details(),
  ),
];
