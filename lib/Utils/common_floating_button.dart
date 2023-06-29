// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
//
// import 'Constants/color_constants.dart';
// import 'Constants/string_constants.dart';
//
// class CommonFloatingButton extends StatelessWidget {
//   RxInt initialPageValue;
//   PageController _controller;
//   IconData icon;
//   String buttonText;
//   VoidCallback onCustomButtonPressed;
//
//   CommonFloatingButton(this.buttonText, this.initialPageValue, this._controller, this.icon, this.onCustomButtonPressed, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       heroTag: buttonText,
//       onPressed: onCustomButtonPressed,
//       tooltip: buttonText,
//       backgroundColor: AppColor.accentLightClr,
//       child: Icon(icon),
//     );
//   }
//
// }
//
// /*
// FloatingActionButton.extended(
//         heroTag: "nextBtn",
//         onPressed: () {
//           if (initialPageValue.value < 1) {
//             initialPageValue.value++;
//             _controller.animateToPage(
//               initialPageValue.value,
//               duration: Duration(milliseconds: 100),
//               curve: Curves.easeIn,
//             );
//           }
//         },
//         tooltip: 'Next',
//         backgroundColor: AppColor.accentLightClr,
//         icon: null,
//         label: const Padding(
//           padding:
//               EdgeInsets.only(top: 0.0, right: 10.0, left: 10.0, bottom: 0.0),
//           child: Text(
//             AppStrings.nextTxt,
//             style: TextStyle(color: AppColor.secondaryClr, fontSize: 20),
//           ),
//         ),
//       )*/