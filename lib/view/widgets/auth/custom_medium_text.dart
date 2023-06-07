import 'package:flutter/material.dart';

class CustomMediumText extends StatefulWidget {
  final String text;
  final TextAlign? align;
  const CustomMediumText({Key? key, required this.text, this.align})
      : super(key: key);

  @override
  State<CustomMediumText> createState() => _CustomMediumTextState();
}

class _CustomMediumTextState extends State<CustomMediumText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.align,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
