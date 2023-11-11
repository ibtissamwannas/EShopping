import 'package:e_shopping/controller/cart/cart_controller.dart';
import 'package:e_shopping/view/widgets/card/top_cart_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/card/app_bar_cart.dart';
import '../../widgets/card/bottom_navigation_bar_cart.dart';
import '../../widgets/card/cart_item_list.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(bottomNavigationBar:
        GetBuilder<CartControllerImp>(builder: (controller) {
      return BottomNaigationCart(
        price: controller.allPriceCount,
        tax: 20,
        totalPrice: 40,
      );
    }), body: GetBuilder<CartControllerImp>(
      builder: (controller) {
        return ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            AppBarWidget(
              text: "My Cart",
            ),
            SizedBox(
              height: 20,
            ),
            TopCartText(
              message:
                  "You Have ${controller.data.length} Item(s) in your cart",
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ...List.generate(
                    controller.data.length,
                    (index) => CartItemList(
                          onPressedAdd: () async {
                            await controller
                                .addCart(controller.data[index].itemId);
                            controller.refreshCardCount();
                          },
                          onPressedRemove: () async {
                            await controller
                                .removeCart(controller.data[index].itemId);
                            controller.refreshCardCount();
                          },
                          name: "${controller.data[index].itemName}",
                          price: "${controller.data[index].itemPrice}",
                          count: "${controller.data[index].countitems}",
                          image_name: "${controller.data[index].itemImage}",
                        ))
              ],
            )
          ],
        );
      },
    ));
  }
}
