import 'package:flutter/material.dart';

import '../../../../../Utils/Constants/color_constants.dart';

class ExternalWalletScreen extends StatelessWidget {
  final String? walletName;

  const ExternalWalletScreen({Key? key, required this.walletName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgBlueClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_balance_wallet,
              size: 48,
              color: AppColor.bgWhiteClr,
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment via External Wallet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.bgWhiteClr,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Wallet Name: $walletName',
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