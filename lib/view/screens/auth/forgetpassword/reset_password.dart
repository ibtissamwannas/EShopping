import 'package:e_shopping/core/classes/handling_data_view.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/reset_password_controller.dart';
import '../../../../core/constants/colors.dart';
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
        builder: (controller) => HandlingDataViewRequest(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: controller.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  CustomBigText(
                    text: "Reset Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomMediumText(text: "Enter the new password"),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextFormPass(
                    obsecureText: controller.isShowPass,
                    hintText: "Password",
                    svgPicture: 'assets/images/auth/password.svg',
                    myController: controller.password,
                    onTapIcon: () {
                      controller.showPass();
                    },
                    validator: (val) {
                      return validInput(val, 5, 30, "password");
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormPass(
                    obsecureText: controller.isShowRePass,
                    hintText: "confirm Password",
                    svgPicture: 'assets/images/auth/password.svg',
                    myController: controller.rePassword,
                    onTapIcon: () {
                      controller.showRePass();
                    },
                    validator: (val) {
                      return validInput(val, 5, 30, "password");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextButtonAuth(
                    text: 'save',
                    onPressed: () => controller.goToSuccessResetPassword(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
