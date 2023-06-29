import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/Network/Repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
 static SignUpController get instance => Get.find();

 final signUpFormKey = GlobalKey<FormState>();
 final signUpNameController = TextEditingController();
 final signUpEmailController = TextEditingController();
 final signUpContactController = TextEditingController();
 final signUpPwdController = TextEditingController();
 final signUpConfirmPwdController = TextEditingController();

 final isSignUpLoading = false.obs;

 void registerUser(String email,String password){
 AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
 }

/* Future<void> createUser() async {
  try{
   isLoading.value = true;
   if(!signUpFormKey.currentState!.validate()){
    isLoading.value = false;
    return;
   }

   ///For Phone Authentication
   //SignUpController.instance.phoneAuthentication(contactController.phoneNo.text.trim());
   //Get.to(()=>const OTPScreen());

   //Get user and pass it to controller
   final user = UserModel(
    email : emailController.text.trim(),
    password : pwdController.text.trim(),
    fullName : nameController.text.trim(),
    phoneNo : contactController.text.trim(),
   );

   //Authentication User first

   final auth = AuthenticationRepository.instance;
   await auth.createUserWithEmailAndPassword(user.email, user.password);
   await UserRepository.instance.createUser(user);
   auth.setInitialScreen(auth.firebaseUser);

  }catch(_){

  }
 }*/

}

class UserModel {
 String email;
 String password;
 String fullName;
 String phoneNo;
 UserModel({required this.email, required this.fullName, required this.password, required this.phoneNo});
}