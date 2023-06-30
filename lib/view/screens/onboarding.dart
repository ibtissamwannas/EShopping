import 'package:e_shopping/controller/onboarding_controller.dart';
import 'package:e_shopping/view/widgets/onboarding/custom_slider.dart';
import 'package:e_shopping/view/widgets/onboarding/custom_text_botton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding/dot_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child: CustomSlider(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    DotController(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextButton()
              ],
            ),
          )
        ],
      )),
    );
  }
}
