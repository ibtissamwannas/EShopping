import 'package:flutter/material.dart';

class CustomTextSignUpOrSignIn extends StatefulWidget {
  final String fistText;
  final String secondText;
  final void Function()? onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key, this.onTap, required this.fistText, required this.secondText})
      : super(key: key);

  @override
  State<CustomTextSignUpOrSignIn> createState() =>
      _CustomTextSignUpOrSignInState();
}

class _CustomTextSignUpOrSignInState extends State<CustomTextSignUpOrSignIn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.fistText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Text(
            widget.secondText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
