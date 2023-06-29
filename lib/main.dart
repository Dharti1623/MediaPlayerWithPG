import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_mix/Network/NetworkHandler/network_binding.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';
import 'package:music_mix/Utils/common_function.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';
import 'firebase_options.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return GetMaterialApp(
        title: 'Mix',
        debugShowCheckedModeBanner: false,
        initialBinding: NetworkBinding(),
        initialRoute: AppRoutes.splashScreen,
        getPages: getPages,
        theme: ThemeData(
          colorScheme: lightColorScheme ?? AppColor.defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? AppColor.defaultDarkColorScheme,
          useMaterial3: true,
        ),
      );
    });
  }
}
