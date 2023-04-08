import 'package:e_shopping/controller/auth/success_sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/success_reset_password_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../widgets/auth/custom_big_text.dart';
import '../../../widgets/auth/custom_medium_text.dart';
import '../../../widgets/auth/custom_text_button.dart';
class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text("Success",style: Theme.of(context).textTheme.headline6),
        elevation: 0,
      ),
      body: Container(padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,),),
            SizedBox(
              height: 20,
            ),
            CustomBigText(text: "successful Reset Password"),
            SizedBox(
              height: 5,
            ),
            CustomMediumText(text: "Enjoy shopping !",align: TextAlign.start,),
            Spacer(),
            CustomTextButtonAuth(text: 'go to login',onPressed: (){controller.goToLogin();},),

          ],
        ),
      ),
    );
  }
}
