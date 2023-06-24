import 'package:e_shopping/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/categories_model.dart';
import '../../../link_api.dart';
import '../../widgets/home/custom_search_bar.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundGreyColor,
          body: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: AppColor.whiteColor,
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColor.black,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: CustomSearchBar(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 39,
                    width: double.infinity,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Categories(
                          i: index,
                          categoriesModel: CategoriesModel.fromJson(
                            controller.categories[index],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 10),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  "${AppLinkApi.itemsImages}/dressItem.png",
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "15\$",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.whiteColor,
                                            border: Border.all(
                                              width: 0.6,
                                              color: AppColor.primaryColor,
                                            )),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "-15%",
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
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "very beauty dress and colorful",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SvgPicture.asset(
                                "assets/icons/heart.svg",
                                height: 25,
                                width: 25,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Visibility(
            visible: controller.showFloatingButton && !controller.isScrolling,
            child: FloatingActionButton(
              backgroundColor: AppColor.backgroundGreyColor,
              onPressed: () {
                controller.scrollToTop();
              },
              child: Icon(
                Icons.arrow_upward,
                color: AppColor.black,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<ItemsControllerImp>(
          builder: (controller) {
            return InkWell(
              onTap: () {
                controller.changeCategoryIndex(i);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundGreyColor,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: controller.selectedCat == i
                          ? AppColor.primaryColor
                          : AppColor.backgroundGreyColor,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  "${categoriesModel.categoryName}",
                  style: TextStyle(
                    fontSize: 15,
                    color: controller.selectedCat == i
                        ? AppColor.primaryColor
                        : AppColor.grey,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
