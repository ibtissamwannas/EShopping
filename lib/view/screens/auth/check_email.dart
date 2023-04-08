import 'package:e_shopping/controller/auth/check_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../widgets/auth/custom_big_text.dart';
import '../../widgets/auth/custom_medium_text.dart';
import '../../widgets/auth/custom_text_button.dart';
import '../../widgets/auth/custom_text_form.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBigText(
                text: "Check Email",
              ),
              SizedBox(
                height: 10,
              ),
              CustomMediumText(
                text: "Enter your email address to receive verification code ",
              ),
              SizedBox(
                height: 80,
              ),
              CustomTextForm(
                hintText: "Email Address",
                svgPicture: 'assets/images/Group.svg',
                myController: controller.email,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextButtonAuth(
                text: 'Check',
                onPressed: () => controller.goToverifyCodeSignUp(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
