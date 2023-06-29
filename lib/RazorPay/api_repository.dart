// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../Data/Models/Request/payment_request_model.dart';
import '../Data/Models/Response/payment_response_model.dart';
import '../Network/NetworkHandler/custom_dio.dart';
import '../UI/CustomWidgets/custom_snackBar.dart';
import '../UI/View/PaymentScreen/ViewModel/payment_view_model.dart';
import '../Utils/Constants/color_constants.dart';
import '../routes/routes.dart';
import 'api_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiServices {
  final razorPayKey = ApiKeys.getRazorKey();
  final razorPaySecret = ApiKeys.getRazorSecret();

  static var customDio = CustomDio();

  // ignore: prefer_typing_uninitialized_variables
  static var dio;
  final paymentViewModel = Get.find<PaymentViewModel>();

  Future<PaymentResponseModel> razorPayApi(num amount, String receiptId) async {
    paymentViewModel.initiateRazorPay();
    try {
      dio = await customDio.getDio();
      paymentViewModel.isPaymentDone.value = true;
      var auth = 'Basic ${base64Encode(utf8.encode('$razorPayKey:$razorPaySecret'))}';
      var headers = {'content-type': 'application/json', 'Authorization': auth};
      dio.options.headers.addAll(headers);
      PaymentRequestModel data = PaymentRequestModel(
          amount: amount * 100,
          currency: "INR".trim(),
          receipt: receiptId.trim());
      final response = await dio.post(ApiKeys.razorPayUrl, data: data.toJson());
      var paymentResponseEntity = PaymentResponseModel(body: response);


      if (response.statusCode == 200) {
        print('success--${response.statusMessage.toString()}');
        paymentViewModel.isPaymentDone.value = false;
        var allResponse = {"status": "success", "body": response.data};
        paymentResponseEntity = PaymentResponseModel.fromJson(allResponse);
      } else {
        print('else--${response.statusMessage.toString()}');
        var allResponse = {"status": "error", "error": response.error};
        paymentResponseEntity = PaymentResponseModel.fromJson(allResponse);
      }
      return paymentResponseEntity;
    } catch (error, stacktrace) {
      if (error is DioError) {
        if (error.response != null) {
          customSnackBar('${error.response!.data['error']}');
          print('catch--${error.response!.data['error']}');
          return PaymentResponseModel.withError(error.response!.data['error']);
        }
      }
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return PaymentResponseModel.withError(error.toString());
    }
  }
}
