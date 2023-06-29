import 'package:flutter/material.dart';

import '../../../../../Utils/Constants/color_constants.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final String? paymentId;

  const PaymentSuccessScreen({Key? key, required this.paymentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgGreenClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 48,
              color: AppColor.bgWhiteClr,
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Successful',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.bgWhiteClr),
            ),
            const SizedBox(height: 16),
            Text(
              'Payment ID: $paymentId',
              style: const TextStyle(color: AppColor.bgWhiteClr),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: AppColor.bgBlackClr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}