import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_medium_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_button.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/router_name.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGreyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/eshopping-low-resolution-color-logo-removebg-preview.png",width: 180,height: 160,fit: BoxFit.cover,)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomBigText(text: "Welcome back !",),
                    SizedBox(
                      height: 10,
                    ),
                    CustomMediumText(text: "Sign in to your account"),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextForm(hintText: "Email Address", svgPicture: 'assets/images/Group.svg',),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormPass(hintText: "Password", svgPicture: 'assets/images/Group 5.svg'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forget Password ?",style: TextStyle(color: AppColor.lightBlue),)
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextButtonAuth(text: 'Login',),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ? ",style: Theme.of(context).textTheme.bodyText2,),
                        GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.signUp);
                            },
                            child: Text("Sign Up",style: Theme.of(context).textTheme.headline1?.merge(TextStyle(fontSize: 17,)),)),
                      ],
                    ),
                  ],),
              ],
            ),
          ),
        ),
      )
    );
  }
}
