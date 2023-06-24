import 'package:e_shopping/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
    const Home(),
  ];

  List bottomTitle = ["Home", "Categories", "Cart", "Favorites", "Me"];

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.grid_view_outlined,
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
