import 'package:e_shopping/view/widgets/auth/custom_text_field_pass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/reset_password_controller.dart';
import '../../../../core/constants/colors.dart';
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
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: AppColor.black,),),
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
              CustomBigText(text: "Reset Password",),
              SizedBox(
                height: 10,
              ),
              CustomMediumText(text: "Enter the code you recieved"),
              SizedBox(
                height: 20,
              ),
              CustomTextFormPass(hintText: "Password", svgPicture: 'assets/images/Group 5.svg',myController: controller.password,),
              SizedBox(height: 10,),
              CustomTextFormPass(hintText: "confirm Password", svgPicture: 'assets/images/Group 5.svg',myController: controller.rePassword,),
              SizedBox(height: 20,),
              CustomTextButtonAuth(text: 'save',onPressed: ()=>controller.goToSuccessResetPassword(),),
            ],
          ),
        ),
      ),
    );
  }
}
