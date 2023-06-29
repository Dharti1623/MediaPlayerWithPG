// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';

import 'Constants/string_constants.dart';

// clearPref() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.clear();
//   Get.offAllNamed(AppRoutes.loginPage);
// }

getStatusBarHeight(context) {
  return MediaQuery.of(context).viewPadding.top;
}

RxInt androidVersion = 0.obs;
RxInt apiLevel = 0.obs;

final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

setInfo(AndroidDeviceInfo infoAndroid) {
  androidVersion.value = int.parse(infoAndroid.version.release);
  apiLevel.value = infoAndroid.version.sdkInt;
}

Future<void> initPlatformState() async {
  if (Platform.isAndroid) {
    setInfo(await deviceInfoPlugin.androidInfo);
  }
}
