import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../Network/Repository/authentication_repository/authentication_repository.dart';
import '../../../../Utils/Constants/color_constants.dart';
import '../../../../Utils/Constants/image_constant.dart';
import '../../../../Utils/Constants/string_constants.dart';
import '../../../../Utils/Constants/text_style_constant.dart';
import '../../../../Utils/common_function.dart';
import '../../../../firebase_options.dart';
import '../../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashTime = 3;
  final OnAudioQuery audioQueryEx = OnAudioQuery();

  @override
  void initState() {
    // initPlatformState();
    LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    audioQueryEx.setLogConfig(logConfig);
    requestPermission();
    splashNavigatePage();
    super.initState();
  }
/*  requestPermission() async {
      if (Platform.isAndroid) {
        bool permissionStatus = await audioQueryEx.permissionsStatus();
        if (!permissionStatus) {
          await audioQueryEx.permissionsRequest();
          if (token != null) {
            Get.offAll(() => const SafeArea(child: HomePage()));
          } else {
            Get.offAll(() => GetBuilder<GetXNetworkManager>(
                builder: (builder) => networkManager.connectionType == 0
                    ? const SomethingWentWrong()
                    : const SafeArea(child: MyLogin())));
          }
        }
      }
  }*/
  splashNavigatePage() async {
    // bool permissionStatus = await audioQueryEx.permissionsStatus();
    // print('permissionStatus-->${permissionStatus}');
    Future.delayed(Duration(seconds: splashTime), () async {
      // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      //     .then((value) => Get.put(AuthenticationRepository()));
      // AuthenticationRepository.instance.onReady();
      Get.offAllNamed(AppRoutes.loginScreen);
    });
  }

  requestPermission() async {
    // Web platform don't support permissions methods.
    if (Platform.isAndroid) {
      bool permissionStatus = await audioQueryEx.permissionsStatus();
      print('hello permissionStatus---$permissionStatus');
      if (!permissionStatus) {
        await audioQueryEx.permissionsRequest();
      }
    }
    if (Platform.isIOS) {
      print('hello');
      bool permissionStatus = await audioQueryEx.permissionsStatus();
      print('hello permissionStatus---$permissionStatus');
      if (!permissionStatus) {
        await audioQueryEx.permissionsRequest();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgWhiteClr,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Center(
                  child: Image(
                image: AssetImage(AppImages.headphonesImage),
                height: 300,
              )),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.26),
                child:  Text(
                  AppStrings.welcomeTxt,
                  style: AppTxtStyle.splashTxtStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
