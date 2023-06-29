import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/UI/CustomWidgets/custom_snackBar.dart';
import 'package:music_mix/UI/View/PaymentScreen/View/offer_list_screen.dart';

import '../../../../Utils/Constants/color_constants.dart';
import '../../../../Utils/Constants/image_constant.dart';
import '../ViewModel/payment_view_model.dart';

class OfferCards extends StatelessWidget {
  double amountData;
  String name;
  String dataTxt;
  String descTxt;
  String image;
  bool isSelected;
  bool isPayed;

  OfferCards(
      {Key? key,
      required this.amountData,
      required this.name,
      required this.dataTxt,
      required this.image,
      required this.isSelected,
      required this.isPayed,
      required this.descTxt})
      : super(key: key);

  final paymentViewModel = Get.find<PaymentViewModel>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => Card(
      elevation: 5,
          color: AppColor().onPrimaryColor(context),
          shape: amountForPayment.value == amountData
              ? BeveledRectangleBorder(
                  side: BorderSide(
                      color: AppColor().onPrimaryContainerColor(context),
                      width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                )
              : BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
          margin: EdgeInsets.only(top: 8, bottom: amountData==150?80:8,left: 8,right: 8),
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            height: size.height * 0.17,
            width: size.width,
            child: Stack(
              children: [
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: '₹',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color:
                                            AppColor().onPrimaryContainerColor(context),
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                  text: '${amountData.round()}',
                                  style: TextStyle(
                                      fontSize: 26,
                                      color:
                                          AppColor().onPrimaryContainerColor(context),
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                    text: '$dataTxt',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            AppColor().onPrimaryContainerColor(context),
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            descTxt,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColor().onPrimaryContainerColor(context),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                amountData % 3 == 0 ? Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                      child: Image.asset(
                        AppImages.limitedOfferImage,
                        height: 42,
                      ),
                    )) :
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Image.asset(
                        AppImages.specialOfferImage,
                        height: 60,
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
