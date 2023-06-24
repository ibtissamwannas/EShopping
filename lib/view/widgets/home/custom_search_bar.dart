import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function()? onTap;
  const CustomSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            prefixIcon: GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIcon: SvgPicture.asset(
              "assets/icons/filter.svg",
              fit: BoxFit.scaleDown,
            ),
            hintText: 'Search Keywords',
            hintStyle: TextStyle(
              color: AppColor.grey,
              fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.grey[120],
          ),
        ),
      ),
    );
  }
}
