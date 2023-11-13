import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Address",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
