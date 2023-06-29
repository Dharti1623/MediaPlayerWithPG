import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../RazorPay/api_keys.dart';
import '../../../../RazorPay/api_repository.dart';
import '../../../CustomWidgets/custom_snackBar.dart';
import '../View/PaymentResponse/payment_error.dart';
import '../View/PaymentResponse/payment_external_wallet.dart';
import '../View/PaymentResponse/payment_success.dart';

class PaymentViewModel extends FullLifeCycleController {
  var isPaymentDone = false.obs;
  var onError = false.obs;
  // late BuildContext context;
  final Razorpay _razorpay = Razorpay();
  final razorPayKey = ApiKeys.getRazorKey();

  final String contactNumber = '7069332572';
  final String emailId = 'dhartic.itpath@gmail.com';

  // final razorPaySecret = ApiKeys.getRazorSecret();

  @override
  void onInit() {
    super.onInit();
  }

  initiateRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    String? paymentId = response.paymentId;
    Get.to(()=>PaymentSuccessScreen(paymentId: paymentId));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    String? message = response.message;
    Get.to(()=>PaymentErrorScreen(message: message));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    String? walletName = response.walletName;
    Get.to(()=>ExternalWalletScreen(walletName: walletName));
  }



  openSession(
      {required num amountVal}) {
    createOrder(amount: amountVal, receiptId: 'rcp_id_1').then((orderId) {
      print(orderId);
      print('khush--orderId---$orderId');
      if (orderId.toString().isNotEmpty) {
        var options = {
          'key': razorPayKey, //Razor pay API Key
          'amount': amountVal, //in the smallest currency sub-unit.
          'name': 'Mix',
          'order_id': orderId,// Generate order_id using Orders API
          'description': 'Play ad free music', //Order Description to be shown in razor pay page
          'timeout': 60, // in seconds
          'prefill': {'contact': contactNumber, 'email': emailId} //contact number and email id of user
        };
        _razorpay.open(options);
      } else {
        customSnackBar('else option---$orderId');
        print('khush--else option---$orderId');
      }
    });
  }
  createOrder({required num amount, required String receiptId}) async {
    var responseData = await ApiServices().razorPayApi(amount, receiptId);
    if (responseData.status == "success") {
      print('responseData->$responseData');
      isPaymentDone.value = false;
    } else {
      isPaymentDone.value = false;
      onError.value = true;
    }
    return responseData.body.id;
  }
}
