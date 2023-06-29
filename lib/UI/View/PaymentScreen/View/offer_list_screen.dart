import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/UI/CustomWidgets/custom_loader.dart';

import '../../../../Data/Models/offer_model.dart';
import '../../../../Utils/Constants/color_constants.dart';
import '../../../../Utils/Constants/string_constants.dart';
import '../../HomePageModule/View/custom_button.dart';
import '../ViewModel/payment_view_model.dart';
import 'amount_widget.dart';

RxDouble amountForPayment = 10.0.obs;

class OfferListScreen extends StatefulWidget {
  OfferListScreen({Key? key}) : super(key: key);

  @override
  State<OfferListScreen> createState() => _OfferListScreenState();
}

class _OfferListScreenState extends State<OfferListScreen> {
  //
  late List<OfferData> listOfferData;
  final paymentViewModel = Get.find<PaymentViewModel>();

  @override
  void initState() {
    listOfferData = _buildOfferDataList(context);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   listOfferData = _buildOfferDataList(context);
  // }

  List<OfferData> _buildOfferDataList(BuildContext context) {
    return [
      OfferData(
          name: AppStrings.weekOfferTxt,
          dataTxt: AppStrings.weekDataTxt,
          descTxt: AppStrings.weekDescTxt,
          image: '',
          isSelected: false,
          amount: 10,
          isPayed: false),
      OfferData(
          name: AppStrings.monthOfferTxt,
          dataTxt: AppStrings.monthDataTxt,
          descTxt: AppStrings.monthDescTxt,
          image: '',
          isSelected: false,
          amount: 20,
          isPayed: false),
      OfferData(
          name: AppStrings.quarterOfferTxt,
          dataTxt: AppStrings.quarterDataTxt,
          descTxt: AppStrings.quarterDescTxt,
          image: '',
          isSelected: false,
          amount: 50,
          isPayed: false),
      OfferData(
          name: AppStrings.halfYearOfferTxt,
          dataTxt: AppStrings.halfYearDataTxt,
          descTxt: AppStrings.halfYearDescTxt,
          image: '',
          isSelected: false,
          amount: 90,
          isPayed: false),
      OfferData(
          name: AppStrings.yearOfferTxt,
          dataTxt: AppStrings.yearDataTxt,
          descTxt: AppStrings.yearDescTxt,
          image: '',
          isSelected: false,
          amount: 150,
          isPayed: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().primaryColor(context),
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, bottom: 10, left: 10, top: 10),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listOfferData.length,
                  itemBuilder: (BuildContext context, int index) {
                    print('list---->${listOfferData.toList()}');
                    return GestureDetector(
                      onTap: () {
                        amountForPayment.value = listOfferData[index].amount;
                      },
                      child: OfferCards(
                        amountData: listOfferData[index].amount,
                        name: listOfferData[index].name,
                        dataTxt: listOfferData[index].dataTxt,
                        image: listOfferData[index].image,
                        isSelected: listOfferData[index].isSelected,
                        isPayed: listOfferData[index].isPayed,
                        descTxt: listOfferData[index].descTxt,
                      ),
                    );
                  }),
            ),
            Obx(() => Align(
                  alignment: Alignment.bottomCenter,
                  child: paymentViewModel.isPaymentDone.value
                      ? CustomLoader(
                          AppColor().onPrimaryContainerColor(context))
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CustomButton(
                              btnColor: AppColor().onPrimaryColor(context),
                              // shadowColor:
                              //     AppColor().disabledColor(context),
                              onTapBtn: () {
                                paymentViewModel.openSession(
                                    amountVal: amountForPayment.value);
                              },
                              height: size.height * 0.08,
                              width: size.width * 0.4,
                              child: Text(AppStrings.payNowTxt,
                                  style: TextStyle(
                                      color: AppColor()
                                          .onPrimaryContainerColor(context),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600))),
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
