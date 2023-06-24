import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/language/custom_button_lang.dart';

class Language extends GetView<LocaleController> {
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
            Text(
              "choose language",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoutes.onBoarding);
                  },
                ),
                CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoutes.onBoarding);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
