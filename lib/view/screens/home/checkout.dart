import 'package:e_shopping/controller/view_address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout_controller.dart';
import '../../../core/constants/colors.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    CheckOutControllerImp controller = Get.put(CheckOutControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Checkout",
            style: Theme.of(context).textTheme.headlineMedium!.merge(
                  TextStyle(
                    fontSize: 20,
                  ),
                ),
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
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          width: Get.width,
          height: 45,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.primaryColor),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // side: BorderSide(color: Colors.red)
                ))),
            onPressed: () {
              // Get.toNamed(AppRoutes.checkOutScreen);
              controller.sendCheckout();
            },
            child: Text(
              "Check out",
            ),
          ),
        ),
        body: GetBuilder<CheckOutControllerImp>(builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "choose payment method",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("cash");
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: controller.paymentmethod == "cash"
                                  ? AppColor.primaryColor
                                  : AppColor.secondaryColor.withOpacity(
                                      0.5,
                                    ),
                            ),
                            child: Text(
                              "Cash On Delivery",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("card");
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                color: controller.paymentmethod == "card"
                                    ? AppColor.primaryColor
                                    : AppColor.secondaryColor.withOpacity(
                                        0.5,
                                      )),
                            child: Text(
                              "Payments Cards",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Choose delivery Type",
                          style: TextStyle(
                            fontSize: 20,
                            color: !controller.isCash
                                ? AppColor.primaryColor
                                : AppColor.secondaryColor.withOpacity(
                                    0.5,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryMethod("delivery");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  color: controller.deliveryType == "delivery"
                                      ? AppColor.primaryColor
                                      : AppColor.secondaryColor.withOpacity(
                                          0.5,
                                        ),
                                ),
                                child: Image.asset(
                                  "assets/images/bike.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryMethod("recieve");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  color: controller.deliveryType == "recieve"
                                      ? AppColor.primaryColor
                                      : AppColor.secondaryColor.withOpacity(
                                          0.5,
                                        ),
                                ),
                                child: Image.asset(
                                  "assets/images/car.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (controller.deliveryType == "delivery")
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              await controller.chooseAddressMethod(
                                controller.data[index].id.toString(),
                              );
                            },
                            child: Card(
                              color: controller.data[index].id.toString() ==
                                      controller.addressid.toString()
                                  ? AppColor.primaryColor
                                  : Colors.white,
                              child: ListTile(
                                title: Text(
                                  "${controller.data[index].city}",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  "${controller.data[index].street}",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                ],
              ),
            ),
          );
        }));
  }
}
