import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/view_address_controller.dart';
import '../../../core/constants/colors.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
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
      body: GetBuilder<ViewAddressController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("${controller.data[index].name}"),
                      subtitle: Text("${controller.data[index].city}"),
                      trailing: IconButton(
                        onPressed: () {
                          controller.deleteData(
                              controller.data[index].id?.toString());
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    )),
              );
            });
      }),
    );
  }
}
