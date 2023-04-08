import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/view/widgets/auth/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/success_sign_up_controller.dart';
import '../../widgets/auth/custom_medium_text.dart';
import '../../widgets/auth/custom_text_button.dart';
class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
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
          CustomBigText(text: "successful Sign Up"),
          SizedBox(
            height: 5,
          ),
          CustomMediumText(text: "Enjoy shopping !",align: TextAlign.start,),
          Spacer(),
          CustomTextButtonAuth(text: 'go to login',onPressed: (){
            controller.goToLogin();
          },),
        ],
      ),
      ),
    );
  }
}