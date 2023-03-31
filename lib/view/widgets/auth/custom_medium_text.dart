import 'package:flutter/material.dart';
class CustomMediumText extends StatefulWidget {
  final String text;
  const CustomMediumText({Key? key, required this.text}) : super(key: key);

  @override
  State<CustomMediumText> createState() => _CustomMediumTextState();
}

class _CustomMediumTextState extends State<CustomMediumText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,style: Theme.of(context).textTheme.bodyText2,);
  }
}
