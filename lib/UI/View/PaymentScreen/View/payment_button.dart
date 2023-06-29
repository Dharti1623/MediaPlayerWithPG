import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';

import '../../../../Utils/Constants/image_constant.dart';
import 'offer_list_screen.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      Get.to(() => OfferListScreen());
    }, icon: const ImageIcon(AssetImage(AppImages.noAdsImage)),iconSize:50,color: AppColor.bgMarronClr,);
  }
}
