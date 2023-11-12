import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shopping/core/classes/handling_data_view.dart';
import 'package:e_shopping/core/constants/colors.dart';
import 'package:e_shopping/core/constants/router_name.dart';
import 'package:e_shopping/data/model/items_model.dart';
import 'package:e_shopping/view/widgets/home/categories_grid_view.dart';
import 'package:e_shopping/view/widgets/home/custom_carousel_slider.dart';
import 'package:e_shopping/view/widgets/home/custom_search_bar.dart';
import 'package:e_shopping/view/widgets/home/custom_title.dart';
import 'package:e_shopping/view/widgets/home/horizontal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/favorite_in_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/functions/translate_db_data.dart';
import '../../../link_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${controller.username}",
                          style: Theme.of(context).textTheme.bodyMedium?.merge(
                                TextStyle(
                                  color: AppColor.textGrey,
                                ),
                              ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/notifications.svg",
                            width: 35,
                            height: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.favorite);
                            },
                            child: Icon(
                              Icons.favorite_border_rounded,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomSearchBar(
                controller: controller.searchCntroller,
                onChanged: (val) {
                  controller.checkval(val);
                },
                onTap: () {
                  controller.onSearchItems();
                },
              ),
              SizedBox(
                height: 20,
              ),
              !controller.isSearch
                  ? HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        children: [
                          CustomCarouselSlider(),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTitle(
                            title: "Categories",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CategoriesGridView(),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTitle(
                            title: "Products For You",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          HorizontalListView()
                        ],
                      ),
                    )
                  : Container(
                      child: istItemsSearch(
                        itemsModel: controller.itemsSearch,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class istItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> itemsModel;
  const istItemsSearch({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp);
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemsModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.81,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: () {
                controller.goToProductDetails(itemsModel[index]);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "${itemsModel[index].itemId}",
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 150,
                      imageUrl:
                          "${AppLinkApi.itemsImages}/${itemsModel[index].itemImage}",
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
                      "${translateDBData(itemsModel[index].itemNameAr ?? "", itemsModel[index].itemName ?? "")}",
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
                        Text(
                          "${itemsModel[index].itemPrice}\$",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        itemsModel[index].itemDiscount != 0
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
                                      "-${itemsModel[index].itemDiscount}%",
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
          );
        });
  }
}
