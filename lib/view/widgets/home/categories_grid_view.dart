import 'package:e_shopping/controller/home_controller.dart';
import 'package:e_shopping/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../link_api.dart';

class CategoriesGridView extends GetView<HomeControllerImp> {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 190,
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              controller.goToSpecificItem(controller.categories, index);
            },
            child: Categories(
              categoriesModel: CategoriesModel.fromJson(
                controller.categories[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: Colors.grey.withOpacity(0.1),
          ),
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.network(
              "${AppLinkApi.categoriesImages}/${categoriesModel.categoryImage}",
              width: 25,
              height: 25,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("${categoriesModel.categoryName}")
      ],
    );
  }
}
