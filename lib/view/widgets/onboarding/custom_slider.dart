import 'package:e_shopping/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../data/static/static.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Container(
            child: Lottie.asset(
              onBoardingList[i].image,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            onBoardingList[i].title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                onBoardingList[i].body,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
