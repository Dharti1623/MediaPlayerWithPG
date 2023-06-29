import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';
import 'package:music_mix/UI/CustomWidgets/custom_snackBar.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';

class LoginController extends GetxController{
 static LoginController get instance => Get.find();

 final loginEmailController = TextEditingController();
 final loginPwdController = TextEditingController();
 GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
 final isLoginLoading = false.obs;
 final isGoogleLoading = false.obs;
 final isFacebookLoading = false.obs;


 void loginUser(String email,String password){
 AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
 }
///[EmailAndPasswordLogin]
Future<void> login() async{
  try{
   isLoginLoading.value = true;
   if(!loginFormKey.currentState!.validate()){
    isLoginLoading.value = false;
    return;
   }
   final auth = AuthenticationRepository.instance;
   await auth.loginWithEmailAndPassword(loginEmailController.text.trim(),loginPwdController.text.trim());
   // auth.setInitialScreen(auth.firebaseUser);
  }catch(e){
   isLoginLoading.value=false;
   customSnackBar(e.toString(),txtColor: AppColor.bgWhiteClr,bgColor: AppColor.bgMarronClr);
  }
}

///[GoogleSignInAuthentication]
Future<void> goggleSignIn() async {
 try{
      isGoogleLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value = false;
    }catch(e){
      isGoogleLoading.value = false;
      customSnackBar(e.toString(),txtColor: AppColor.bgWhiteClr,bgColor: AppColor.bgMarronClr);
    }
  }
///[FacebookSignInAuthentication]
Future<void> facebookSignIn() async {
 try{
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithFacebook();
      isGoogleLoading.value = false;
      auth.setInitialScreen(auth.firebaseUser);

    }catch(e){
      isGoogleLoading.value = false;
      customSnackBar(e.toString(),txtColor: AppColor.bgWhiteClr,bgColor: AppColor.bgMarronClr);
    }
  }




}