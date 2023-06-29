import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../common_function.dart';

class AppColor {
  static const Color shadowClr =  Color(0x1A000000);
  static const Color bgBlackClr =  Color(0xFF000000);
  static const Color bgBlueClr =  Color(0xFF2196F3);
  static const Color bgWhiteClr =  Color(0xFFFFFFFF);
  static const Color bgMarronClr =  Color(0xFFB40C0C);
  static const Color bgRedClr =  Colors.red;
  static const Color bgGreenClr =  Colors.green;


  static const Color transparentClr = Colors.transparent;
/*  static const Color primaryClr =  Color(0xFF536DFE);
  static const Color secondaryClr =  Color(0xFF2E3B86);
  static const Color onPrimaryClr =  Color(0xFFDBDDEA);
  static const Color onPrimaryContainerClr =  Color(0xFF161F4F);
  static const Color primaryContainerClr =  Color(0xFF4F61C2);
  static const Color surfaceClr = Color(0xFFFFFFFF);*/

//use this like AppColor().primaryColor(context)
  String isDark = 'Brightness.dark';
  static final defaultLightColorScheme = ColorScheme.fromSeed(seedColor: Colors.cyan,brightness: Brightness.light);
  static final defaultDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.purple, brightness: Brightness.dark);

  primaryColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.primary;
        }else{
          return themeData.colorScheme.primary;
        }
      }else{
        return themeData.colorScheme.primary;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.primary;
    }else{
      return themeData.colorScheme.primary;
    }
  }
  cardColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.cardColor;
        }else{
          return themeData.cardColor;
        }
      }else{
        return themeData.cardColor;
      }
    }else if(Platform.isIOS){
      return themeData.cardColor;
    }else{
      return themeData.cardColor;
    }
  }
  canvasColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.canvasColor;
        }else{
          return themeData.canvasColor;
        }
      }else{
        return themeData.canvasColor;
      }
    }else if(Platform.isIOS){
      return themeData.canvasColor;
    }else{
      return themeData.canvasColor;
    }
  }
  onPrimaryColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.onPrimary;
        }else{
          return themeData.colorScheme.onPrimary;
        }
      }else{
        return themeData.colorScheme.onPrimary;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.onPrimary;
    }else{
      return themeData.colorScheme.onPrimary;
    }
  }
  primaryContainerColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.primaryContainer;
        }else{
          return themeData.colorScheme.primaryContainer;
        }
      }else{
        return themeData.colorScheme.primaryContainer;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.primaryContainer;
    }else{
      return themeData.colorScheme.primaryContainer;
    }
  }
  onPrimaryContainerColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.onPrimaryContainer;
        }else{
          return themeData.colorScheme.onPrimaryContainer;
        }
      }else{
        return themeData.colorScheme.onPrimaryContainer;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.onPrimaryContainer;
    }else{
      return themeData.colorScheme.onPrimaryContainer;
    }
  }
  secondaryColor(BuildContext context) {
    var themeData = Theme.of(context);
    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.secondary;
        }else{
          return themeData.colorScheme.secondary;
        }
      }else{
        return themeData.colorScheme.secondary;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.secondary;
    }else{
      return themeData.colorScheme.secondary;
    }
  }
  surfaceColor(BuildContext context) {
    var themeData = Theme.of(context);
    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.surface;
        }else{
          return themeData.colorScheme.surface;
        }
      }else{
        return themeData.colorScheme.surface;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.surface;
    }else{
      return themeData.colorScheme.surface;
    }
  }
  errorColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.error;
        }else{
          return themeData.colorScheme.error;
        }
      }else{
        return themeData.colorScheme.error;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.error;
    }else{
      return themeData.colorScheme.error;
    }
  }
  disabledColor(BuildContext context) {
    var themeData = Theme.of(context);
    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.disabledColor;
        }else{
          return themeData.disabledColor;
        }
      }else{
        return themeData.disabledColor;
      }
    }else if(Platform.isIOS){
      return themeData.disabledColor;
    }else{
      return themeData.disabledColor;
    }
  }
  tertiaryColor(BuildContext context) {
    var themeData = Theme.of(context);

    if(Platform.isAndroid){
      if(androidVersion.value >= 12){
        if(themeData.brightness.toString() == isDark){
          return themeData.colorScheme.tertiary;
        }else{
          return themeData.colorScheme.tertiary;
        }
      }else{
        return themeData.colorScheme.tertiary;
      }
    }else if(Platform.isIOS){
      return themeData.colorScheme.tertiary;
    }else{
      return themeData.colorScheme.tertiary;
    }
  }
}

