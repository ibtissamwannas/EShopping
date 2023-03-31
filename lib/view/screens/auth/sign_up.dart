import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_medium_text.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_button.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundGreyColor,
       
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  CustomBigText(text: "Create an account"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomMediumText(text: "And start shopping !"),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextForm(hintText: "Email Address", svgPicture: 'assets/images/Group.svg'),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(hintText: "phone number", svgPicture: 'assets/images/telephone 1.svg',),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormPass(hintText: "Password", svgPicture: 'assets/images/Group 5.svg'),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextButtonAuth(text: 'Sign Up'),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ? ",style: Theme.of(context).textTheme.bodyText2,),
                      GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Text("Sign Up",style: Theme.of(context).textTheme.headline1?.merge(TextStyle(fontSize: 17,)),)),
                    ],
                  ),
                ],),
            ),
          ),
        )
    );
  }
}
