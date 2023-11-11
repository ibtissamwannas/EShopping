import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../link_api.dart';

class CartItemList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image_name;
  final Function()? onPressedAdd;
  final Function()? onPressedRemove;
  const CartItemList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.image_name,
    required this.onPressedAdd,
    required this.onPressedRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                "${AppLinkApi.itemsImages}/$image_name",
                height: 80,
                width: 80,
              ),
            ),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.black,
                    ),
                  ),
                  subtitle: Text(
                    price,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                IconButton(
                  onPressed: onPressedAdd,
                  icon: Icon(Icons.add),
                ),
                Text(count),
                IconButton(
                  onPressed: onPressedRemove,
                  icon: Icon(Icons.remove),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
