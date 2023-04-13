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

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                      hintText: "Email Address",
                      svgPicture: 'assets/images/auth/email.svg',
                      myController: controller.email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextForm(
                      hintText: "phone number",
                      svgPicture: 'assets/images/auth/phone.svg',
                      myController: controller.phoneNumber,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormPass(
                      hintText: "Password",
                      svgPicture: 'assets/images/auth/password.svg',
                      myController: controller.password,
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
        ));
  }
}
