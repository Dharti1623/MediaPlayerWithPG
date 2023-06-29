import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/UI/View/LoginScreen/text-field.dart';
import 'package:music_mix/UI/View/SignUpScreen/forget_password_screen.dart';
import 'package:music_mix/features/authentication/controllers/login_controller.dart';
import 'package:music_mix/features/authentication/controllers/signup_controller.dart';
import 'package:pretty_button/pretty_button.dart';

import '../../../Utils/Constants/color_constants.dart';
import '../../../Utils/Constants/image_constant.dart';
import '../../../Utils/Constants/string_constants.dart';
import '../../../routes/routes.dart';
import '../../CustomWidgets/custom_icon_button.dart';
import '../../CustomWidgets/custom_loader.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmVisible = false.obs;
  final signUpController = Get.put(SignUpController());
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColor().onPrimaryColor(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(() => Container(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.05,
                      horizontal: size.width * 0.06),
                  child: Form(
                    key: signUpController.signUpFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image: const AssetImage(AppImages.headphonesImage),
                            height: size.height * 0.3),
                        const SizedBox(height: 20),
                        TextFieldsWithValidation(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                              context: context,
                              icon: Icons.person_2_outlined,
                              color: AppColor().primaryColor(context)),
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          controller: signUpController.signUpNameController,
                          textInputType: TextInputType.name,
                          hintText: AppStrings.nameTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.emptyValidation(value),
                        ),
                        TextFieldsWithValidation(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                              context: context,
                              icon: Icons.email_outlined,
                              color: AppColor().primaryColor(context)),
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          controller: signUpController.signUpEmailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: AppStrings.emailTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.emailValidation(value),
                        ),
                        TextFieldsWithValidation(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                              context: context,
                              icon: Icons.call_outlined,
                              color: AppColor().primaryColor(context)),
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          controller: signUpController.signUpContactController,
                          textInputType: TextInputType.phone,
                          hintText: AppStrings.contactTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.contactNumberValidation(value),
                        ),
                        TextFieldsWithValidation(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                              context: context,
                              icon: Icons.fingerprint_outlined,
                              color: AppColor().primaryColor(context)),
                          obscureText: !isPasswordVisible.value,
                          suffixIcon: IconButton(
                            icon: customIcon(
                                context: context,
                                icon: isPasswordVisible.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 21,
                                color: AppColor().primaryColor(context)),
                            onPressed: () {
                              if (kDebugMode) {
                                print(isPasswordVisible.value);
                              }
                              isPasswordVisible.value =
                                  !isPasswordVisible.value;
                            },
                          ),
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.visiblePassword,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          controller: signUpController.signUpPwdController,
                          hintText: AppStrings.pwdTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.passwordValidation(value),
                        ),
                        TextFieldsWithValidation(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                              context: context,
                              icon: Icons.fingerprint_outlined,
                              color: AppColor().primaryColor(context)),
                          obscureText: !isConfirmVisible.value,
                          suffixIcon: IconButton(
                            icon: customIcon(
                                context: context,
                                icon: isConfirmVisible.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 21,
                                color: AppColor().primaryColor(context)),
                            onPressed: () {
                              if (kDebugMode) {
                                print(isConfirmVisible.value);
                              }
                              isConfirmVisible.value = !isConfirmVisible.value;
                            },
                          ),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          controller: signUpController.signUpConfirmPwdController,
                          hintText: AppStrings.confirmPwdTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.confirmPasswordValidation(
                                  value, signUpController.signUpPwdController.text),
                        ),SizedBox(height: size.height * 0.03),
                        PrettyButton(
                          backgroundColor: AppColor().onPrimaryColor(context),
                          bottomShadowColor: AppColor().disabledColor(context),
                          topShadowColor: AppColor().disabledColor(context),
                          height: size.height * 0.06,
                          width: size.width,
                          innerPadding: const EdgeInsets.symmetric(vertical: 2),
                          outerPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          blurRadius: 8,
                          spreadRadius: 2,
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (signUpController.signUpFormKey.currentState!.validate() && signUpController.signUpPwdController.text.trim() != "") {
                              signUpController.registerUser(signUpController.signUpEmailController.text.trim(), signUpController.signUpPwdController.text.trim());
                              // Get.offAllNamed(AppRoutes.choiceScreen);
                            }
                          },
                          borderRadius: 6,
                          child: Text(
                            AppStrings.registerTxt,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppColor()
                                    .onPrimaryContainerColor(context)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {Get.to(()=> ForgetPwdScreen());},
                            child: Text('${AppStrings.forgetPwdTxt}??',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor().primaryColor(context),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        GestureDetector(
                          onTap: () => Get.offAllNamed(AppRoutes.loginScreen),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppStrings.registerPageTxt,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor().onPrimaryContainerColor(context),
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                  text: '\t${AppStrings.signInTxt}',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: AppColor().onPrimaryContainerColor(context),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(AppStrings.orTxt,
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                AppColor().onPrimaryContainerColor(context),
                                fontWeight: FontWeight.w400)),
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: loginController
                                    .isFacebookLoading.value ||
                                    loginController.isLoginLoading.value
                                    ? () {}
                                    : loginController.isGoogleLoading.value
                                    ? () {}
                                    : () => loginController.goggleSignIn(),
                                icon: loginController.isGoogleLoading.value ? CustomLoader(AppColor().onPrimaryContainerColor(
                                    context)) :Image.asset(
                                  AppImages.googleImage,
                                  width: 55,
                                )),
                            IconButton(
                                onPressed: loginController
                                    .isGoogleLoading.value ||
                                    loginController.isLoginLoading.value
                                    ? () {}
                                    : loginController.isFacebookLoading.value
                                    ? () {}
                                    : () => loginController.facebookSignIn(),
                                icon: loginController.isFacebookLoading.value ? CustomLoader(AppColor().onPrimaryContainerColor(
                                    context)) :Image.asset(
                                  AppImages.fb2Image,
                                  width: 50,
                                )),
                            /*IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      AppImages.fb2Image,
                                      width: 50,
                                    )),*/
                          ],
                        )),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  AppImages.googleImage,
                                  width: 55,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  AppImages.fb2Image,
                                  width: 50,
                                )),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
