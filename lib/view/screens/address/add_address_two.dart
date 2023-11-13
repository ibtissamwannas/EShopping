import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/add_address_two_controller.dart';
import '../../../core/constants/colors.dart';

class AddAddressTwo extends StatelessWidget {
  const AddAddressTwo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(addAddressTwoControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Address",
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
      body: Column(
        children: [],
      ),
    );
  }
}
