import 'package:e_shopping/controller/home_controller.dart';
import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../link_api.dart';

class HorizontalListView extends GetView<HomeControllerImp> {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 260,
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductsForYou(
            itemsModel: ItemsModel.fromJson(
              controller.items[index],
            ),
          );
        },
      ),
    );
  }
}

class ProductsForYou extends StatelessWidget {
  final ItemsModel itemsModel;
  const ProductsForYou({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 230,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "${AppLinkApi.itemsImages}/${itemsModel.itemImage}",
                    width: 230,
                    height: 190,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    "assets/icons/heart.svg",
                    height: 25,
                    width: 25,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                "${itemsModel.itemPrice}\$",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.whiteColor,
                    border: Border.all(
                      width: 0.6,
                      color: AppColor.primaryColor,
                    )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "-${itemsModel.itemDiscount}%",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 230,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${itemsModel.itemName}",
                  style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
