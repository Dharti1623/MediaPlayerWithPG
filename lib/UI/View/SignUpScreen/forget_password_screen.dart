import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';
import 'package:music_mix/Utils/Constants/image_constant.dart';
import 'package:music_mix/Utils/Constants/string_constants.dart';
import 'package:pretty_button/pretty_button.dart';

import '../LoginScreen/text-field.dart';
import 'otp_screen.dart';

class ForgetPwdScreen extends StatelessWidget {
  ForgetPwdScreen({super.key});

  final forgetPwdMailController = TextEditingController();
  GlobalKey<FormState> forgetPwdFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColor().onPrimaryColor(context),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                  left: 30, right: 30.0, top: size.height * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                      AppImages.forgetPwdImage, height: size.height * 0.3),
                  SizedBox(height: size.height * 0.05),
                  Text(AppStrings.forgetPwdTxt,
                      style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w900,)),
                  Text(
                    AppStrings.forgetPwdScreenTxt,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: forgetPwdFormKey,
                      child: Column(
                        children: [
                          TextFieldsWithValidation(
                            textInputType: TextInputType.emailAddress,
                            maxLines: 1,
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            controller: forgetPwdMailController,
                            padding: const EdgeInsets.only(
                                top: 24.0, bottom: 16.0),
                            hintText: AppStrings.emailTxt,
                            borderRadius: 5,
                            validator: (String? value) =>
                                Validator.emailValidation(value),
                          ),
                          PrettyButton(
                            onTap: () {
                              if (forgetPwdFormKey.currentState!.validate()) {
                                Get.to(() => OTPScreen());
                              }
                            },
                            backgroundColor: AppColor().onPrimaryContainerColor(
                                context),
                            blurRadius: 8,
                            // height: 48,
                            spreadRadius: 1,
                            innerPadding: EdgeInsets.zero,
                            bottomShadowColor: AppColor().disabledColor(context),
                            topShadowColor: AppColor().disabledColor(context),
                            width: double.infinity,
                            borderRadius: 5,
                            outerPadding: EdgeInsets.zero,
                            child: Text(AppStrings.nextTxt, style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: AppColor().onPrimaryColor(context))),

                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
