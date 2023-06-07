import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_shopping/core/classes/handling_data_view.dart';
import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/link_api.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
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
                            "Ibtissam Al Wannas",
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
                              "assets/icons/notification.svg",
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        prefixIcon: SvgPicture.asset(
                          "assets/icons/search.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        suffixIcon: SvgPicture.asset(
                          "assets/icons/filter.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: 'Search Keywords',
                        hintStyle:
                            TextStyle(color: AppColor.grey, fontSize: 15),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 9 / 4,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.easeInExpo,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              controller.current_slider = index;
                            });
                          }),
                      items: imgList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 18, right: 18, top: 0, bottom: 0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFD0EFFD)
                                                .withOpacity(0.2),
                                            blurRadius: 20,
                                            spreadRadius: 0.0,
                                            offset: Offset(0.0, 10.0),
                                          )
                                        ],
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/placeholder_rectangle.png',
                                            image: i,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ))),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0,
                      right: 0,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                imgList.length,
                                (index) => AnimatedContainer(
                                  margin: EdgeInsets.only(left: 5),
                                  duration: Duration(milliseconds: 900),
                                  width: controller.current_slider == index
                                      ? 25
                                      : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: controller.current_slider == index
                                        ? AppColor.black
                                        : AppColor.lightGrey,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   height: 70,
                //   child: ListView.separated(
                //     itemCount: controller.categories.length,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Column(
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(35),
                //                 color: AppColor.secondaryColor),
                //             padding: EdgeInsets.all(10),
                //             height: 30,
                //             width: 70,
                //             child: SvgPicture.network(
                //               "${AppLinkApi.categoriesImages}/${controller.categories[index]['category_image']}",
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //     separatorBuilder: (BuildContext context, int index) {
                //       return SizedBox(
                //         width: 10,
                //       );
                //     },
                //   ),
                // ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 190,
                    width: double.infinity,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 30.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(38),
                                  color: AppColor.secondaryColor),
                              padding: EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.network(
                                  "${AppLinkApi.categoriesImages}/${controller.categories[index]['category_image']}",
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "${controller.categories[index]['category_name']}")
                          ],
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
}
