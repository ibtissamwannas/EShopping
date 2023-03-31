import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
class CustomTextButtonAuth extends StatefulWidget {
  final String text;
  const CustomTextButtonAuth({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomTextButtonAuth> createState() => _CustomTextButtonAuthState();
}

class _CustomTextButtonAuthState extends State<CustomTextButtonAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [AppColor.primaryColor,AppColor.secondaryColor])
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // side: BorderSide(color: Colors.red)
                ))),
        onPressed: () {
          // controller.goNext();
        },
        child: Text(
          widget.text,
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}