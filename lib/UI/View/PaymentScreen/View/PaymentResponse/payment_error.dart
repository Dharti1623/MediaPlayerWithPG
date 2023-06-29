import 'package:flutter/material.dart';

import '../../../../../Utils/Constants/color_constants.dart';

class PaymentErrorScreen extends StatelessWidget {
  final String? message;

  const PaymentErrorScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgRedClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: AppColor.bgWhiteClr,
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Failed',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.bgWhiteClr),
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $message',
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