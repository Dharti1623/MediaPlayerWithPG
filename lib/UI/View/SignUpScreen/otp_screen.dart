import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';
import 'package:music_mix/Utils/Constants/string_constants.dart';
import 'package:pretty_button/pretty_button.dart';

import '../../../Utils/Constants/image_constant.dart';
import '../../../Utils/Constants/text_style_constant.dart';
import 'mail_verification_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor().onPrimaryColor(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
               top: size.height*0.15, bottom: 20.0, right: 30.0, left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.otpImage, height: size.height * 0.3),
              SizedBox(height:size.height*0.05),
              Text(
                AppStrings.verificationTxt.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                '${AppStrings.enterCodeTxt}\n${AppStrings.supportMailAddressTxt}',
                textAlign: TextAlign.center,style: AppTxtStyle().customStyle(color: AppColor().onPrimaryContainerColor(context),fontSize: 16.0,fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.04),
              OtpTextField(
                numberOfFields: 6,
                filled: true,
                fillColor: AppColor.bgBlackClr.withOpacity(0.1),
                borderColor: AppColor().onPrimaryContainerColor(context),
                cursorColor: AppColor().onPrimaryContainerColor(context),
                onSubmit: (code){
                  print('Otp is -> $code');
                },
              ),
              PrettyButton(
                onTap: () {
                  Get.to(() => MailVerificationScreen());
                },
                backgroundColor: AppColor().onPrimaryContainerColor(context),
                blurRadius: 8,
                height: size.height * 0.06,
                spreadRadius: 1,
                innerPadding: EdgeInsets.zero,
                bottomShadowColor: AppColor().disabledColor(context),
                topShadowColor: AppColor().disabledColor(context),
                width: double.infinity,
                borderRadius: 5,
                outerPadding: const EdgeInsets.only(top: 24.0, bottom: 20.0),
                child: Text(AppStrings.nextTxt,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColor().onPrimaryColor(context))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
