import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("texting"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 55,
              borderRadius: BorderRadius.circular(20),
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
