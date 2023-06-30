import 'package:e_shopping/controller/home/items_controller.dart';
import 'package:e_shopping/core/classes/handling_data_view.dart';
import 'package:e_shopping/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../widgets/home/custom_search_bar.dart';
import '../../widgets/home/custome_list_items.dart';
import '../../widgets/home/horizontal_items_list.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Scaffold(
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
                    child: HorizontalItemsList(),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 10),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.81,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CustomeListItems(
                          itemsModel: ItemsModel.fromJson(
                            controller.data[index],
                          ),
                        );
                      },
                      childCount: controller.data.length,
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
          ),
        );
      },
    );
  }
}
