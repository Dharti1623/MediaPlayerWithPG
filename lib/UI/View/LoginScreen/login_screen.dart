import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/UI/View/LoginScreen/text-field.dart';
import 'package:music_mix/Utils/Constants/string_constants.dart';
import 'package:pretty_button/pretty_button.dart';

import '../../../Utils/Constants/color_constants.dart';
import '../../../Utils/Constants/image_constant.dart';
import '../../../features/authentication/controllers/login_controller.dart';
import '../../../routes/routes.dart';
import '../../CustomWidgets/custom_icon_button.dart';
import '../../CustomWidgets/custom_loader.dart';
import '../SignUpScreen/forget_password_screen.dart';
import '../SignUpScreen/otp_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  RxBool isLoginPasswordVisible = false.obs;

  final loginControllers = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColor().onPrimaryColor(context),
        // backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(() => Container(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.07,
                      horizontal: size.width * 0.06),
                  child: Form(
                    key: loginControllers.loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image: const AssetImage(AppImages.headphonesImage),
                            height: size.height * 0.3),
                        SizedBox(height: size.height * 0.03),
                        TextFieldsWithValidation(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                              icon: Icons.person_outline_outlined,
                              context: context),
                          textInputAction: TextInputAction.next,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 6),
                          controller: loginControllers.loginEmailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: AppStrings.userNameTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.emailValidation(value),
                        ),
                        TextFieldsWithValidation(
                          obscureText: !isLoginPasswordVisible.value,
                          suffixIcon: IconButton(
                            icon: customIcon(
                              context: context,
                              icon: !isLoginPasswordVisible.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 25,
                            ),
                            onPressed: () {
                              isLoginPasswordVisible.value =
                                  !isLoginPasswordVisible.value;
                            },
                          ),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: customIcon(
                            context: context,
                            icon: Icons.fingerprint_outlined,
                          ),
                          textInputAction: TextInputAction.done,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 6),
                          controller: loginControllers.loginPwdController,
                          textInputType: TextInputType.visiblePassword,
                          hintText: AppStrings.pwdTxt,
                          maxLines: 1,
                          validator: (value) =>
                              Validator.passwordValidation(value),
                        ),
                        SizedBox(height: size.height * 0.03),
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
                            if (loginControllers.loginFormKey.currentState!
                                    .validate() &&
                                loginControllers.loginPwdController.text.trim() != "") {
                              loginControllers.loginUser(
                                  loginControllers.loginEmailController.text.trim(),
                                  loginControllers.loginPwdController.text.trim());
                              // Get.offAllNamed(AppRoutes.choiceScreen);
                            }
                          },
                          borderRadius: 6,
                          child: Text(
                            AppStrings.loginTxt,
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
                          onTap: () => Get.offAllNamed(AppRoutes.signUpScreen),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppStrings.loginPageTxt,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor()
                                            .onPrimaryContainerColor(context),
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                  text: '\t${AppStrings.signUpTxt}',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: AppColor()
                                          .onPrimaryContainerColor(context),
                                      fontWeight: FontWeight.w800),
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
                                    onPressed: loginControllers
                                                .isFacebookLoading.value ||
                                            loginControllers.isLoginLoading.value
                                        ? () {}
                                        : loginControllers.isGoogleLoading.value
                                            ? () {}
                                            : () => loginControllers.goggleSignIn(),
                                    icon: loginControllers.isGoogleLoading.value ? CustomLoader(AppColor().onPrimaryContainerColor(
                                        context)) :Image.asset(
                                      AppImages.googleImage,
                                      width: 55,
                                    )),
                                IconButton(
                                    onPressed: loginControllers
                                                .isGoogleLoading.value ||
                                            loginControllers.isLoginLoading.value
                                        ? () {}
                                        : loginControllers.isFacebookLoading.value
                                            ? () {}
                                            : () => loginControllers.facebookSignIn(),
                                    icon: loginControllers.isFacebookLoading.value ? CustomLoader(AppColor().onPrimaryContainerColor(
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
