import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/Constants/color_constants.dart';

SnackbarController customSnackBar(String message,
    {Color? bgColor, Color? txtColor}) {
  return Get.rawSnackbar(
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    padding:const EdgeInsets.all(6),
    duration: const Duration(seconds: 1),
    backgroundColor: bgColor ?? AppColor.bgBlackClr,
    messageText: Text(
      message,
      style: TextStyle(color: txtColor ?? AppColor.bgWhiteClr),
    ),
  );
}
