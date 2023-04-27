import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextForm extends StatefulWidget {
  final String hintText;
  final String svgPicture;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final bool isNumber;
  const CustomTextForm(
      {Key? key,
      required this.hintText,
      required this.svgPicture,
      required this.myController,
      this.validator,
      required this.isNumber})
      : super(key: key);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.isNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
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
