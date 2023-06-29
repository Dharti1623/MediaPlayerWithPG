import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';
import 'package:music_mix/UI/CustomWidgets/custom_snackBar.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;


  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  /// -- Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
    }catch(e){
      customSnackBar(e.toString(),bgColor: AppColor.bgMarronClr,txtColor: AppColor.bgWhiteClr);
    }
  }


/// -- Set Timer to check if Verification Completed thrn Redirect
  void setTimerForAutoRedirect(){
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(AuthenticationRepository.instance.firebaseUser);
      }
    });
  }

/// -- Manually Check if Verification Completed then Redirect
  void manuallyCheckEmailVerificationStatus(){}

}