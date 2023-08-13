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
            contentPadding: EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                10,
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
            hintStyle: Theme.of(context).textTheme.bodyMedium?.merge(
                  TextStyle(
                    color: AppColor.textGrey,
                  ),
                ),
            filled: true,
            fillColor: Colors.grey[120],
          ),
        ),
      ),
    );
  }
}
