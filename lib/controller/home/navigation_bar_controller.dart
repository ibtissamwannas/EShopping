import 'package:e_shopping/view/screens/favorite/favorite.dart';
import 'package:e_shopping/view/screens/home/cart.dart';
import 'package:e_shopping/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/settings/setting.dart';

abstract class bottomNavigationBarController extends GetxController {
  changePage(int currentpage);
}

class bottomNavigationBarControllerImp extends bottomNavigationBarController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    const Home(),
    const Cart(),
    const FavoriteScreen(),
    const Setting(),
  ];

  List bottomTitle = ["Home", "Notification", "Cart", "Favorites", "Me"];

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.notifications_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite_border,
    Icons.person_2_outlined
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
