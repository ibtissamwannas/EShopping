import 'package:e_shopping/controller/settings_controller.dart';
import 'package:e_shopping/core/constants/router_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/colors.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Profile",
      //     style: Theme.of(context).textTheme.headlineMedium,
      //   ),
      //   elevation: 0,
      //   backgroundColor: AppColor.whiteColor,
      // ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                child: Container(
                  height: Get.width / 3,
                  color: AppColor.primaryColor,
                ),
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.primaryColor,
                    backgroundImage: AssetImage("assets/images/sale1.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text("Disable notification"),
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                      activeColor: AppColor.secondaryColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.AddressView);
                    },
                    title: Text("Address"),
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.allorder);
                    },
                    title: Text("Orders"),
                    trailing: Icon(Icons.delivery_dining),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.archieveOrder);
                    },
                    title: Text("Archieve"),
                    trailing: Icon(Icons.delivery_dining),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("About Us"),
                    trailing: Icon(Icons.help_outline_outlined),
                  ),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+96171116962"));
                    },
                    title: Text("Contact Us"),
                    trailing: Icon(Icons.phone),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.logout),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.tracking);
                    },
                    title: Text("Approve"),
                    trailing: Icon(Icons.done),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
