// import 'package:shared_preferences/shared_preferences.dart';
// import 'string_constants.dart';
//
// class SharedPreference {
//
//   static const String keyUserToken = "user_token";
//   static const String keyUserId = "user_id";
//   static const String keyUserEmail = "user_email";
//   static const String keyUserFName = "user_first_name";
//   static const String keyUserLName = "user_last_name";
//
//
//   Future<String> getUserToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString(keyUserToken);
//     print("$token");
//     return token ?? "";
//   }
//   Future<String> getUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userId = prefs.getString(keyUserId);
//     print("$userId");
//     return userId ?? "";
//   }
//   Future<String> getUserEmail() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userEmail = prefs.getString(keyUserEmail);
//     print("$userEmail");
//     return userEmail ?? "";
//   }
//
//   Future<String> getUserFName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userFName = prefs.getString(keyUserFName);
//     print("$userFName");
//     return userFName ?? "";
//   }
//
//   Future<String> getUserLName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userLName = prefs.getString(keyUserLName);
//     print("$userLName");
//     return userLName ?? "";
//   }
//
// }