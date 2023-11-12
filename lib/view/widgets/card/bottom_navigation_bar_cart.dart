import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';

class BottomNaigationCart extends StatelessWidget {
  final String price;
  final double totalPrice;
  final double tax;
  const BottomNaigationCart({
    super.key,
    required this.price,
    required this.totalPrice,
    required this.tax,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "$price",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tax",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "$tax",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "$totalPrice",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              width: Get.width,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.primaryColor,
                      elevation: 0),
                  onPressed: () {},
                  child: Text("Order Now")))
        ],
      ),
    );
  }
}
