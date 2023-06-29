// import 'package:flutter/material.dart';
//
// import '../../Utils/Constants/color_constants.dart';
//
// class NoDataFound extends StatelessWidget {
//   const NoDataFound({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColor.transparentClr,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: size.height * 0.15,bottom: size.height * 0.05),
//             child: Align(
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   AppImages.emptyDataListImage,
//                   alignment: Alignment.center,
//                   height: size.height * 0.3,
//                 )),
//           ),
//            Align(
//               alignment: Alignment.center,
//               child: Text(AppStrings.noDataTxt,style: TextStyle(fontSize: 45.0,color: AppColor.accentDarkClr,fontWeight: FontWeight.w800),)),
//         ],
//       ),
//     );
//   }
// }
