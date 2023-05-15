import 'package:e_shopping/controller/auth/sign_up_controller.dart';
import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_medium_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_button.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_form_field.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_signup_or_signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/valid_input.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomBigText(text: "Create an account"),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomMediumText(text: "And start shopping !"),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextForm(
                          hintText: "UserName",
                          svgPicture: 'assets/images/auth/user.svg',
                          myController: controller.username,
                          validator: (val) {
                            return validInput(val, 5, 30, "username");
                          },
                          isNumber: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextForm(
                          hintText: "Email Address",
                          svgPicture: 'assets/images/auth/email.svg',
                          myController: controller.email,
                          validator: (val) {
                            return validInput(val, 5, 30, "email");
                          },
                          isNumber: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextForm(
                          hintText: "phone number",
                          svgPicture: 'assets/images/auth/phone.svg',
                          myController: controller.phoneNumber,
                          validator: (val) {
                            return validInput(val, 5, 30, "phone");
                          },
                          isNumber: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<SignUpControllerImp>(
                          builder: (controller) => CustomTextFormPass(
                            obsecureText: controller.isShowPass,
                            onTapIcon: () {
                              controller.showPass();
                            },
                            hintText: "Password",
                            svgPicture: 'assets/images/auth/password.svg',
                            myController: controller.password,
                            validator: (val) {
                              return validInput(val, 5, 30, "password");
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextButtonAuth(
                          text: 'Sign Up',
                          onPressed: () => controller.signUp(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextSignUpOrSignIn(
                          fistText: "Already have an account ? ",
                          secondText: "Login",
                          onTap: () {
                            controller.goToLogin();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
