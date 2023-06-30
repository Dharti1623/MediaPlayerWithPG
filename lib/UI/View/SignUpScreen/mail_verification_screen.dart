import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';
import 'package:music_mix/Utils/Constants/image_constant.dart';
import 'package:music_mix/Utils/Constants/text_style_constant.dart';
import 'package:music_mix/features/authentication/controllers/mail_verification_Controller.dart';
import 'package:pretty_button/pretty_button.dart';

import '../../../Utils/Constants/color_constants.dart';
import '../../../Utils/Constants/string_constants.dart';

class MailVerificationScreen extends StatelessWidget {
   MailVerificationScreen({super.key});

  // final mailVerificationController = Get.put(MailVerificationController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 28.0, right: 28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.12),
              Image.asset(AppImages.openEnvelopeImage,width: size.width*0.2,),
              SizedBox(height: size.height * 0.02),
              Text(AppStrings.verifyMailTxt,style: AppTxtStyle().verifyEmailTextStyle(context),),
              SizedBox(height: size.height * 0.05),
              Text(AppStrings.resendMailDesc1Txt,style: AppTxtStyle().verifyEmailMsgTextStyle(context),textAlign: TextAlign.center),
              SizedBox(height: size.height * 0.02),
              Text(AppStrings.resendMailDesc2Txt,style: AppTxtStyle().verifyEmailMsgTextStyle(context),textAlign: TextAlign.center),
              SizedBox(height: size.height * 0.1),
              PrettyButton(
                backgroundColor: AppColor().disabledColor(context),
                // backgroundColor: Colors.grey.shade300,
                bottomShadowColor: AppColor().disabledColor(context),
                // topShadowColor: AppColor().disabledColor(context),
                height: size.height * 0.065,
                width: size.width*0.6,
                innerPadding: const EdgeInsets.symmetric(vertical: 2),
                outerPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                blurRadius: 8,
                spreadRadius: 2,
                // onTap: () =>mailVerificationController.manuallyCheckEmailVerificationStatus(),
                borderRadius: 6,
                child: Text(
                  AppStrings.continueTxt,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor().onPrimaryContainerColor(context)),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              GestureDetector(
                // onTap: ()=>mailVerificationController.sendVerificationEmail(),
                child: Text(
                  AppStrings.resendMailTxt,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bgBlueClr),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: ()=>AuthenticationRepository.instance.logout(),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: AppStrings.leftArrowTxt,
                          style: TextStyle(
                              fontSize: 45,
                              color: AppColor.bgBlueClr,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                        text: '${AppStrings.backToLoginTxt}',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.bgBlueClr,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
