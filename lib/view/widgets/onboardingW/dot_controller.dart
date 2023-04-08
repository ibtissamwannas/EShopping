import 'package:e_shopping/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../data/static/static.dart';

class DotController extends StatelessWidget {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Row(
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: EdgeInsets.only(left: 5),
                    duration: Duration(milliseconds: 900),
                    width:controller.currentPage == index? 25:6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: controller.currentPage == index
                            ? AppColor.primaryColor
                            : AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(10,
                        ),
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
