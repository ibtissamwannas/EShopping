import 'package:e_shopping/view/widgets/auth/custom_text_button.dart';
import 'package:e_shopping/view/widgets/auth/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/add_address_two_controller.dart';
import '../../../core/constants/colors.dart';

class AddAddressTwo extends StatelessWidget {
  const AddAddressTwo({super.key});

  @override
  Widget build(BuildContext context) {
    addAddressTwoControllerImp controller =
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Name"),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              CustomTextForm(
                hintText: "name",
                svgPicture: "",
                myController: controller.name,
                isNumber: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("City"),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              CustomTextForm(
                hintText: "city",
                svgPicture: "",
                myController: controller.city,
                isNumber: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Street"),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              CustomTextForm(
                hintText: "street",
                svgPicture: "",
                myController: controller.street,
                isNumber: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextButtonAuth(
                text: "Add",
                onPressed: () {
                  controller.addAddress();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
