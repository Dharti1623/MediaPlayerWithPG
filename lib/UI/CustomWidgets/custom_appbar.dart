import 'package:flutter/material.dart';
import '../../Utils/Constants/color_constants.dart';
import '../../Utils/Constants/string_constants.dart';

AppBar customAppBar(BuildContext context, Widget title) {
  return AppBar(
    backgroundColor: AppColor().primaryColor(context),
    title: title,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 24,color: AppColor().surfaceColor(context)),
    iconTheme: IconThemeData(color: AppColor().surfaceColor(context)),
  );
}

