import 'package:flutter/material.dart';
import 'package:pretty_button/pretty_button.dart';
import '../../../../Utils/Constants/color_constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Widget child;
  Function() onTapBtn;
  double height;
  double width;
  Color? btnColor;
  Color? shadowColor;

  CustomButton(
      {Key? key,
      required this.child,
      required this.onTapBtn,
      required this.height,
      required this.width,
      this.btnColor,
      this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrettyButton(
      onTap: onTapBtn,
      borderRadius: 12,
      innerPadding: const EdgeInsets.all(0),
      outerPadding: const EdgeInsets.all(10),
      backgroundColor: btnColor ?? AppColor().onPrimaryColor(context),
      topShadowColor: AppColor().disabledColor(context),
      bottomShadowColor:shadowColor?? AppColor().disabledColor(context),
      height: height,
      width: width,
      spreadRadius: 1,
      blurRadius: 8,
      child: child,
    );
  }
}
/*PushableButton(
          btnColor:btnColor ?? AppColor().secondaryColor(context),
          height: height,
          width: width,
        elevation: 4,
        onPressed: onTapBtn,
        shadow:  BoxShadow(color:shadowColor??AppColor().onPrimaryContainerColor(context),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 2)),
          child: child,
      ),*/
/*child: Center(
        child: GestureDetector(
          onTap: onTapBtn,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.purple,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4, 4)
                ),
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(-4, -4)
                )
              ],
            ),
            child: Center(child: data),
          ),
        ),
      ),*/
