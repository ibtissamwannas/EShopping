import 'package:e_shopping/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(notificationControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Notification",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .merge(TextStyle(color: AppColor.primaryColor)),
          ),
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
        ),
        body: GetBuilder<notificationControllerImp>(
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text("Title ${controller.data[index].title}"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("body ${controller.data[index].body}"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("date ${controller.data[index].date}"),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
