import 'package:e_shopping/core/classes/handling_data_view.dart';
import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/view/widgets/home/categories_grid_view.dart';
import 'package:e_shopping/view/widgets/home/custom_carousel_slider.dart';
import 'package:e_shopping/view/widgets/home/custom_search_bar.dart';
import 'package:e_shopping/view/widgets/home/custom_title.dart';
import 'package:e_shopping/view/widgets/home/horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(
                              color: AppColor.grey,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${controller.username}",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/notifications.svg",
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomSearchBar(),
                SizedBox(
                  height: 20,
                ),
                CustomCarouselSlider(),
                SizedBox(
                  height: 20,
                ),
                CustomTitle(
                  title: "Categories",
                ),
                SizedBox(
                  height: 10,
                ),
                CategoriesGridView(),
                SizedBox(
                  height: 20,
                ),
                CustomTitle(
                  title: "Products For You",
                ),
                SizedBox(
                  height: 10,
                ),
                HorizontalListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
