import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class TopCartText extends StatelessWidget {
  final String message;

  const TopCartText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Center(
        child: Text(
          message,
        ),
      ),
    );
  }
}
