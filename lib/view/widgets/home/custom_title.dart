import 'package:e_shopping/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "See all",
            style: Theme.of(context).textTheme.bodyMedium?.merge(
                  TextStyle(
                    color: AppColor.textGrey,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
