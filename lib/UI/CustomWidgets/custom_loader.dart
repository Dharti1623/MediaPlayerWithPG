import 'package:flutter/material.dart';

import '../../Utils/Constants/color_constants.dart';

// Widget customLoader(){
//   return Center(
//     child: CircularProgressIndicator(color: AppColor.bgGreyClr)
//   );
// }
// ignore: must_be_immutable
class CustomLoader extends StatelessWidget {
  Color clr;

  CustomLoader(this.clr, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: clr),
    );
  }
}
