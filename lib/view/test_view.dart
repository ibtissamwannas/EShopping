import 'package:e_shopping/controller/test_controller.dart';
import 'package:e_shopping/core/classes/status_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(
              child: Text("loading"),
            );
          } else if (controller.statusRequest == StatusRequest.offlineFailuer) {
            return const Center(
              child: Text("offline"),
            );
          } else if (controller.statusRequest == StatusRequest.serverFailure) {
            return const Center(
              child: Text("server"),
            );
          } else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            );
          }
        },
      ),
    );
  }
}
