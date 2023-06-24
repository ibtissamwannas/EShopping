import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controller/auth/success_reset_password_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../widgets/auth/custom_big_text.dart';
import '../../../widgets/auth/custom_medium_text.dart';
import '../../../widgets/auth/custom_text_button.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text("Success", style: Theme.of(context).textTheme.headline6),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AppImageAssets.success, height: 350),
            CustomBigText(text: "successful reset password"),
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
    );
  }
}
