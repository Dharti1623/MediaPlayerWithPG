import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class AppTxtStyle {
  ///splash screen
  static TextStyle splashTxtStyle = GoogleFonts.nunitoSans(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    color: AppColor.bgBlackClr,
  );
  static TextStyle customAppbarTxtStyle = GoogleFonts.nunitoSans(
    color: AppColor.bgWhiteClr,
    fontSize: 24.0,
  );
  static TextStyle yesNoBtnTxtStyle =
  GoogleFonts.nunitoSans(fontSize: 20, color: AppColor.bgWhiteClr);

  TextStyle hintTextStyle(BuildContext context) {
    return GoogleFonts.nunitoSans(
      color: AppColor().disabledColor(context),
      fontSize: 17,
    );
  }

  TextStyle labelTextStyle(BuildContext context) {
    return GoogleFonts.nunitoSans(decoration: TextDecoration.none,
        color: AppColor().primaryColor(context));
  }

  TextStyle errorTextStyle(BuildContext context) {
    return GoogleFonts.nunitoSans(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w500,
        color: AppColor().errorColor(context),
        fontSize: 14);
  }
  TextStyle verifyEmailTextStyle(BuildContext context) {
    return GoogleFonts.nunitoSans(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w800,
        color: AppColor().onPrimaryContainerColor(context),
        fontSize: 17);
  }
  TextStyle verifyEmailMsgTextStyle(BuildContext context) {
    return GoogleFonts.nunitoSans(
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w600,
        color: AppColor().onPrimaryContainerColor(context),
        fontSize: 14);
  }


  TextStyle normalStyle(BuildContext context) {
    return GoogleFonts.nunitoSans(color: AppColor().primaryColor(context),decoration: TextDecoration.none);
  }


  TextStyle customStyle({fontSize, fontWeight,required Color color}) {
    return GoogleFonts.nunitoSans(fontSize: fontSize,fontWeight: fontWeight,color: color);
  }




}