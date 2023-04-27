import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/core/functions/alert_exit_app.dart';
import 'package:e_shopping/core/functions/valid_input.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_medium_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_button.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../widgets/auth/custom_text_signup_or_signin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomBigText(
                        text: "Welcome back !",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomMediumText(
                        text: "Sign in to your account",
                        align: TextAlign.start,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextForm(
                        hintText: "Email Address",
                        svgPicture: 'assets/images/auth/email.svg',
                        myController: controller.email,
                        validator: (val) {
                          return validInput(val, 5, 100, "email");
                        },
                        isNumber: false,
                      ),
                      SizedBox(
                        height: 10,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text("Forget Password ?",
                                  style: TextStyle(color: AppColor.lightBlue))),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextButtonAuth(
                        text: 'Login',
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextSignUpOrSignIn(
                        fistText: "Don't have an account ? ",
                        secondText: "Sign Up",
                        onTap: () {
                          controller.goToSignUp();
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
    );
  }
}
