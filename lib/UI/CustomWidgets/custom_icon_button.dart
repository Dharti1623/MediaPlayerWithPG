import 'package:flutter/material.dart';

import '../../Utils/Constants/color_constants.dart';

/*// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  IconData icon;
  Color? iconClr;
  double iconSize;
  VoidCallback? onTap;

  CustomIcon({
    Key? key,
    required this.icon,
    this.iconClr,
    this.iconSize = 20,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: iconClr ?? AppColor().primaryColor(context),size: iconSize,);
  }
}*/

customIcon({required BuildContext context, required IconData icon, double size=26,Color? color}){
  return Icon(icon, color: color ?? AppColor().primaryColor(context),size: size);
}