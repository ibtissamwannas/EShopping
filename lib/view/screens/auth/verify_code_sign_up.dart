import 'package:e_shopping/controller/auth/verify_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../controller/auth/verify_code_sign_up_controller.dart';
import '../../widgets/auth/custom_big_text.dart';
import '../../widgets/auth/custom_medium_text.dart';

class VerifyCodeSignUp extends StatefulWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  State<VerifyCodeSignUp> createState() => _VerifyCodeSignUpState();
}

class _VerifyCodeSignUpState extends State<VerifyCodeSignUp> {
  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller = Get.put(VerifyCodeSignUpControllerImp());
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomBigText(text: "Verify Code",),
              SizedBox(
                height: 10,
              ),
              CustomMediumText(text: "Enter the code you have been received at ibtissamwannas21@gmail.com",align: TextAlign.center,),
              SizedBox(
                height: 50,
              ),
              OtpTextField(
                numberOfFields: 5,
                fieldWidth: 55,
                borderRadius: BorderRadius.circular(10),
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  controller.goToSuccessSignUp();
                }, // end onSubmit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
