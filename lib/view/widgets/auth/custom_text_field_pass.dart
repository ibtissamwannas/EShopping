import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';

class CustomTextFormPass extends StatefulWidget {
  final String hintText;
  final String svgPicture;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final void Function()? onTapIcon;
  const CustomTextFormPass({
    Key? key,
    required this.hintText,
    required this.svgPicture,
    required this.myController,
    this.validator,
    this.obsecureText = false,
    this.onTapIcon,
  }) : super(key: key);

  @override
  State<CustomTextFormPass> createState() => _CustomTextFormPassState();
}

class _CustomTextFormPassState extends State<CustomTextFormPass> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obsecureText,
      keyboardType: TextInputType.text,
      controller: widget.myController,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            widget.svgPicture,
            // width: 24,
            // height: 24,
          ),
        ),
        suffixIcon: InkWell(
          onTap: widget.onTapIcon,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              widget.obsecureText ? Icons.visibility : Icons.visibility_off,
              color: AppColor.lightGrey,
            ),
          ),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
