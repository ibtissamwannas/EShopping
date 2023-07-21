import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/items_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translate_db_data.dart';
import '../../../data/model/categories_model.dart';

class HorizontalItemsList extends GetView<ItemsControllerImp> {
  const HorizontalItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
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
                controller.changeCategoryIndex(
                  i,
                  categoriesModel.categoriesId.toString(),
                );
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
                  "${translateDBData(categoriesModel.categoryNameAr ?? "", categoriesModel.categoryName ?? "")}",
                  style: TextStyle(
                    fontSize: 15,
                    color: controller.selectedCat == i
                        ? AppColor.primaryColor
                        : AppColor.textGrey,
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
