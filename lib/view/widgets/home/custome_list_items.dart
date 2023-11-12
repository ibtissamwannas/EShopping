import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shopping/controller/favorite_in_controller.dart';
import 'package:e_shopping/controller/home/items_controller.dart';
import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translate_db_data.dart';
import '../../../link_api.dart';

class CustomeListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomeListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: GestureDetector(
            onTap: () {
              controller.goToProductDetails(itemsModel);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "${itemsModel.itemId}",
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: 170,
                    imageUrl:
                        "${AppLinkApi.itemsImages}/${itemsModel.itemImage}",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "${translateDBData(itemsModel.itemNameAr ?? "", itemsModel.itemName ?? "")}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${itemsModel.itemPrice}\$",
                            style: TextStyle(
                              decoration: itemsModel.itemDiscount != 0
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          itemsModel.itemDiscount != 0
                              ? Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "${itemsModel.discountPrice}\$",
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      itemsModel.itemDiscount != 0
                          ? Container(
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
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Text(
                        "4.6",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        GetBuilder<FavoriteControllerImp>(builder: (controller) {
          return GestureDetector(
            onTap: () {
              if (controller.isFavorite[itemsModel.itemId] == 1) {
                controller.setFavorite(itemsModel.itemId, 0);
                controller.removeFavorite(itemsModel.itemId);
              } else {
                controller.setFavorite(itemsModel.itemId, 1);
                controller.addFavorite(itemsModel.itemId);
              }
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    controller.isFavorite[itemsModel.itemId] == 1
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  )
                  //  SvgPicture.asset(
                  //   "assets/icons/heart.svg",
                  //   height: 25,
                  //   width: 25,
                  // ),
                  ),
            ),
          );
        })
      ],
    );
  }
}
