import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  const AppBarWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
