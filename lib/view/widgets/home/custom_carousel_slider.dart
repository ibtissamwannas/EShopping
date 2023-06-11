import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constants/colors.dart';

class CustomCarouselSlider extends GetView<HomeControllerImp> {
  CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.easeInExpo,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                controller.onPageChanged(index);
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
                              color: Color(0xFFD0EFFD).withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 0.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                              "$i",
                              fit: BoxFit.cover,
                            )
                            // FadeInImage.assetNetwork(
                            //   placeholder: '',
                            //   image: i,
                            //   height: 200,
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                      ),
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
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    imgList.length,
                    (index) => AnimatedContainer(
                      margin: EdgeInsets.only(left: 5),
                      duration: Duration(milliseconds: 900),
                      width: controller.current_slider == index ? 25 : 8,
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
    );
  }

  final List<String> imgList = [
    "assets/images/discount1.jpg",
    "assets/images/discount2.jpg",
  ];
}
