// import 'package:flutter/material.dart';
// import '../../core/constants/colors.dart';

// class CustomeButtonNavigatorBar extends StatelessWidget {
//   final void Function()? onPressed;
//   final String text;
//   final IconData iconData;
//   final bool active;
//   const CustomeButtonNavigatorBar({
//     super.key,
//     this.onPressed,
//     required this.text,
//     required this.iconData,
//     required this.active,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onPressed,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             iconData,
//             color: active ? AppColor.primaryColor : AppColor.black,
//           ),
//           Text(
//             text,
//             style: TextStyle(
//               color: active ? AppColor.primaryColor : AppColor.black,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
