import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({Key? key, required this.textbutton, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
        child: MaterialButton(
          onPressed: onPressed,
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Text(textbutton, style:const TextStyle(fontWeight: FontWeight.bold,
          ),),
        ),);
  }
}
