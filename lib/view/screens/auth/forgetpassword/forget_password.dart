import 'package:e_shopping/controller/auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../widgets/auth/custom_big_text.dart';
import '../../../widgets/auth/custom_medium_text.dart';
import '../../../widgets/auth/custom_text_button.dart';
import '../../../widgets/auth/custom_text_form.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Password Recovery",style: Theme.of(context).textTheme.headline6),
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
              CustomBigText(text: "Forget Password",),
              SizedBox(
                height: 10,
              ),
              CustomMediumText(text: "Enter your email address to receive verification code "),
              SizedBox(
                height: 80,
              ),
              CustomTextForm(hintText: "Email Address", svgPicture: 'assets/images/Group.svg',myController: controller.email,),
              SizedBox(height: 20,),
              CustomTextButtonAuth(text: 'Send Link',onPressed: ()=>controller.goToVerifyCode(),),
            ],
          ),
        ),
      ),
    );
  }
}
