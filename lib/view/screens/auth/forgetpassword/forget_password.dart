import 'package:e_shopping/controller/auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/classes/handling_data_view.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../widgets/auth/custom_big_text.dart';
import '../../../widgets/auth/custom_medium_text.dart';
import '../../../widgets/auth/custom_text_button.dart';
import '../../../widgets/auth/custom_text_form_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Password Recovery",
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                      text: "Forget Password",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomMediumText(
                      text:
                          "Enter your email address to receive verification code ",
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.06),
                            spreadRadius: 0.1,
                            blurRadius: 20,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CustomTextForm(
                        hintText: "Email Address",
                        svgPicture: 'assets/images/auth/email.svg',
                        myController: controller.email,
                        isNumber: false,
                        validator: (val) {
                          return validInput(val, 5, 100, "email");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextButtonAuth(
                      text: 'Send Link',
                      onPressed: () => controller.checkEmail(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
