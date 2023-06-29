import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';
import 'package:music_mix/UI/CustomWidgets/custom_icon_button.dart';
import 'package:music_mix/Utils/Constants/image_constant.dart';

import '../../../../Utils/Constants/color_constants.dart';
import '../../../../Utils/common_function.dart';
import '../../../../routes/routes.dart';

// ignore: must_be_immutable
class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor().onPrimaryColor(context),
      body: Padding(
        padding: EdgeInsets.only(top: getStatusBarHeight(context)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.screenImage,
                fit: BoxFit.cover, height: size.height, width: size.width),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.bgWhiteClr),
                  child: IconButton(
                    onPressed: () {
                      AuthenticationRepository.instance.logout();
                    },
                    icon: customIcon(
                      context: context,
                      icon: Icons.logout,
                      size: 50,
                      color: AppColor().onPrimaryContainerColor(context),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder<void>(
                future: _initGoogleMobileAds(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            if (snapshot.hasData) {
                              Get.toNamed(AppRoutes.homePage);
                            } else if (snapshot.hasError) {
                              Get.rawSnackbar(message: 'Error');
                            } else {
                              Get.rawSnackbar(message: 'Please wait');
                            }
                          },
                          child: Image(
                              image: AssetImage(AppImages.audioImage),
                              width: size.width * 0.9,
                              height: size.height * 0.4)),
                      InkWell(
                          onTap: () {},
                          child: Image(
                              image: AssetImage(AppImages.videoImage),
                              width: size.width * 0.9,
                              height: size.height * 0.4)),
                      /*ImageButton(
                          width: size.width * 0.9,
                          height: size.height * 0.4,
                          image: AppImages.audioImage,
                          onTap: () {
                            if (snapshot.hasData) {
                              Get.toNamed(AppRoutes.homePage);
                            } else if (snapshot.hasError) {
                              Get.rawSnackbar(message: 'Error');
                            } else {
                              Get.rawSnackbar(message: 'Please wait');
                            }
                          }),*/
                      /*ImageButton(
                          width: size.width * 0.9,
                          height: size.height * 0.4,
                          image: AppImages.videoImage,
                          onTap: () {}),*/
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}

/* CustomButton(
                        Image.asset(AppImages.audioImage),
                        (){Get.toNamed(AppRoutes.homePage);},size.height*0.4,size.width*0.9),
                    CustomButton(
                        Image.asset(AppImages.videoImage),
                            (){},size.height*0.4,size.width*0.9),*/
