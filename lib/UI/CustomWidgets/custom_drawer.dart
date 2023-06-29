// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Utils/Constants/color_constants.dart';
// import '../../Utils/Constants/image_constant.dart';
// import '../../Utils/Constants/prefs_constants.dart';
// import '../../Utils/Constants/string_constants.dart';
// import '../../Utils/common_function.dart';
// import '../View/HomePageModule/View/home_page.dart';
// import '../View/LogoutModule/logout_model.dart';
//
// class CustomDrawer extends StatelessWidget {
//   CustomDrawer({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var themeData = Theme.of(context);
//     RxBool isDark = false.obs;
//     themeData.brightness.toString() == 'Brightness.dark'
//         ? isDark.value = true
//         : isDark.value = false;
//     return Container(
//         color: Colors.transparent,
//         child: Row(children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.7,
//             child: Drawer(
//               backgroundColor: AppColor.secondaryClr,
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   Container(
//                     color: AppColor.primaryClr,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: getStatusBarHeight(context)),
//                           child: Align(
//                               alignment: Alignment.centerRight,
//                               child: IconButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 icon: Icon(Icons.arrow_back_ios_rounded,
//                                     color: AppColor.secondaryClr),
//                                 tooltip: 'Back',
//                               )),
//                         ),
//                         UserAccountsDrawerHeader(
//                         margin: EdgeInsets.zero,
//                           decoration: BoxDecoration(
//                               color: AppColor.primaryClr),
//                           accountName: Text(
//                             'eve.holt',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           accountEmail: Text(
//                             ' ${usrEmail.value}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           currentAccountPicture: CircleAvatar(
//                               backgroundImage: AssetImage(AppImages.cartoonImage),
//                               backgroundColor: AppColor.secondaryClr)
//                         ),
//                       ],
//                     ),
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.house_outlined, size: 28,color: AppColor.bgBlackClr),
//                     title:
//                         const Text('Page 1', style: TextStyle(fontSize: 18.0,color: AppColor.bgBlackClr)),
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.apartment, size: 28,color: AppColor.bgBlackClr),
//                     title:
//                         const Text('Page 2', style: TextStyle(fontSize: 18.0,color: AppColor.bgBlackClr)),
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.access_alarms, size: 28,color: AppColor.bgBlackClr),
//                     title:
//                         const Text('Page 3', style: TextStyle(fontSize: 18.0,color: AppColor.bgBlackClr)),
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.favorite, size: 28,color: AppColor.bgBlackClr),
//                     title: const Text('Favorites',
//                         style: TextStyle(fontSize: 18.0,color: AppColor.bgBlackClr)),
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   const Divider(
//                     indent: 15,
//                     endIndent: 30,
//                     height: 10,
//                     color: AppColor.accentDarkClr,
//                     thickness: 1,
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.logout_rounded, size: 28,color: AppColor.bgBlackClr),
//                     title: const Text(AppStrings.logoutTxt,
//                         style: TextStyle(fontSize: 18.0,color: AppColor.bgBlackClr)),
//                     onTap: () {
//                       Navigator.pop(context);
//                       showDialog(
//                           barrierDismissible: false,
//                           context: context,
//                           builder: (context) => LogoutModel());
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ]));
//   }
// }
