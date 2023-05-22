import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/core/constants/image_assets.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/auth/success_sign_up_controller.dart';
import '../../widgets/auth/custom_medium_text.dart';
import '../../widgets/auth/custom_text_button.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppImageAssets.success, height: 350),
              CustomBigText(text: "successful Sign Up"),
              SizedBox(
                height: 5,
              ),
              CustomMediumText(
                text: "Enjoy shopping !",
                align: TextAlign.start,
              ),
              SizedBox(
                height: 100,
              ),
              CustomTextButtonAuth(
                text: 'go to login',
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
