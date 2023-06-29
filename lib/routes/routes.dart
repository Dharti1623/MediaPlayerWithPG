import 'package:get/get.dart';
import 'package:music_mix/UI/View/HomePageModule/View/home_page.dart';
import 'package:music_mix/UI/View/HomePageModule/View/splash_screen.dart';
import 'package:music_mix/UI/View/LoginScreen/login_screen.dart';
import 'package:music_mix/UI/View/SignUpScreen/signup_screen.dart';

import '../UI/View/HomePageModule/View/choice.dart';
import '../UI/View/PaymentScreen/View/offer_list_screen.dart';

class AppRoutes {
  static String homePage = '/homePage';
  static String splashScreen = '/splashScreen';
  static String trackScreen = '/songScreen';
  static String choiceScreen = '/choiceScreen';
  static String paymentScreen = '/paymentScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
}

final getPages = [
  GetPage(
    name: AppRoutes.homePage,
    page: () => HomePage(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoutes.loginScreen,
    page: () => LoginScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.signUpScreen,
    page: () => SignUpScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => const SplashScreen(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoutes.choiceScreen,
    page: () => Choice(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoutes.paymentScreen,
    page: () => OfferListScreen(),
    transition: Transition.rightToLeftWithFade,
  ),
];
