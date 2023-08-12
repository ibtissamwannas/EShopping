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
        return Scaffold(
          backgroundColor: AppColor.backgroundGreyColor,
          appBar: AppBar(
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
          body: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CustomSearchBar(),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: HorizontalItemsList()),
                  GetBuilder<ItemsControllerImp>(builder: (controller) {
                    return HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                            itemCount: controller.data.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.81,
                            ),
                            itemBuilder: (context, index) {
                              return CustomeListItems(
                                  itemsModel: ItemsModel.fromJson(
                                controller.data[index],
                              ));
                            }));
                  })
                ],
              )),
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
