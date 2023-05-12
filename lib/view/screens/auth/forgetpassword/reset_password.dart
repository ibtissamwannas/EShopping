import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../controller/auth/reset_password_controller.dart';
import '../../../../core/classes/status_request.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../widgets/auth/custom_big_text.dart';
import '../../../widgets/auth/custom_medium_text.dart';
import '../../../widgets/auth/custom_text_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.black,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? Center(
                  child: Lottie.asset(
                    AppImageAssets.loading,
                    repeat: true,
                    width: 200,
                    height: 200,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomBigText(
                          text: "Reset Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomMediumText(text: "Enter the code you recieved"),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormPass(
                          hintText: "Password",
                          svgPicture: 'assets/images/auth/password.svg',
                          myController: controller.password,
                          validator: (val) {
                            return validInput(val, 5, 30, "password");
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFormPass(
                          hintText: "confirm Password",
                          svgPicture: 'assets/images/auth/password.svg',
                          myController: controller.rePassword,
                          validator: (val) {
                            return validInput(val, 5, 30, "password");
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextButtonAuth(
                          text: 'save',
                          onPressed: () =>
                              controller.goToSuccessResetPassword(),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
