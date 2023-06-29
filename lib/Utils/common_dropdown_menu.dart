// import 'package:flutter/material.dart';
// import 'package:material3/Utils/Constants/color_constants.dart';
// import 'package:get/get.dart';
//
// class CustomDropDown extends StatelessWidget {
//   final Function onChangedCallback;
//   String initialValue ;
//   final Iterable<String> menuItems;
//   CustomDropDown(this.onChangedCallback,this.initialValue,this.menuItems,{Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16.0),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.only(left: 15.0, right: 10.0),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5.0),
//               border: Border.all(color: AppColor.primaryClr,width: 2.0)),
//           child: MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: DropdownButtonHideUnderline(
//               child: ButtonTheme(
//                 alignedDropdown: true,
//                 child: DropdownButton(
//                     value: initialValue,
//                     dropdownColor: AppColor.secondaryClr,
//                     items: menuItems.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         enabled: value != 'Please select 1',
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       onChangedCallback(newValue);
//                     }),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
