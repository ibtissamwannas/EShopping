import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/language/CustomeBottonLang.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("choose Language",style: Theme.of(context).textTheme.headline1,),
            SizedBox(
              height: Get.height*0.05,
            ),
            CustomButtonLang(textbutton: "Ar",onPressed: (){},),
            CustomButtonLang(textbutton: "En",onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
