import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/product_details_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translate_db_data.dart';
import '../../../link_api.dart';
import '../../widgets/auth/custom_text_button.dart';

class ProductDetials extends StatelessWidget {
  const ProductDetials({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsImp());
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
      body: GetBuilder<ProductDetailsImp>(
        builder: (controller) => Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: "${controller.itemsModel.itemId}",
                        child: Image.network(
                          "${AppLinkApi.itemsImages}/${controller.itemsModel.itemImage}",
                          width: 130,
                          height: 190,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${controller.itemsModel.itemPrice}\$",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SvgPicture.asset(
                          "assets/icons/heart.svg",
                          height: 25,
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${translateDBData(controller.itemsModel.itemNameAr ?? "", controller.itemsModel.itemName ?? "")}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text(
                          "4.6",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: controller.toggleExpand,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "${translateDBData(controller.itemsModel.itemDescAr ?? "", controller.itemsModel.itemDesc ?? "")}",
                              maxLines: controller.isExpanded ? null : 2,
                              overflow: controller.isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        if (controller.itemsModel.itemDesc!.length > 200 ||
                            controller.itemsModel.itemDescAr!.length > 200)
                          GestureDetector(
                            onTap: controller.toggleExpand,
                            child: Text(
                              controller.isExpanded
                                  ? ' Show less'
                                  : ' Show more',
                              style: TextStyle(
                                  color: Colors
                                      .blue), // Customize link color if needed
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Colors",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 40,
                      child: ListView.builder(
                          itemCount: controller.colorData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                controller.selectedColorIndex == index;
                            return GestureDetector(
                              onTap: () {
                                controller.setSelectedColorIndex(index);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                height: isSelected ? 35 : 25,
                                width: isSelected ? 35 : 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.colorData[index]["name"],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColor.backgroundGreyColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Quantity"),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: controller.decrementQuantity,
                          icon: Icon(
                            Icons.remove,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 1,
                          color: AppColor.greylight,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${controller.productQuantity}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 60,
                          width: 1,
                          color: AppColor.greylight,
                        ),
                        IconButton(
                          onPressed: controller.incrementQuantity,
                          icon: Icon(
                            Icons.add,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextButtonAuth(
                text: 'Add to Cart',
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
