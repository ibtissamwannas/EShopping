import 'package:e_shopping/controller/archieve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/colors.dart';

class ArchieveOrders extends StatelessWidget {
  const ArchieveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchieveControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "All Orders",
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
        body: GetBuilder<ArchieveControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Order Number : ${controller.data[index].id}"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Order Type : ${controller.data[index].ordersType == 0 ? "Delivery" : controller.data[index].ordersType == 0 ? "Recieve" : "Archieve"}",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Order Price : ${controller.data[index].orderTotalprice}"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Order Payment : ${controller.data[index].paymentType == 0 ? "Cash on delivery" : "Payment Card"}",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Order status : ${controller.data[index].orderStatus == 0 ? "Pending approval" : controller.data[index].orderStatus == 1 ? "The order is beign prepared" : controller.data[index].orderStatus == 2 ? "Ready to prepare" : controller.data[index].orderStatus == 3 ? "On the way" : "Archieve"}",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }));
  }
}
