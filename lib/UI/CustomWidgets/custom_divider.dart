import 'package:flutter/material.dart';

import '../../Utils/Constants/color_constants.dart';
class TracksDivider extends StatelessWidget {
  double lineThickNess;
  Color clr;
  TracksDivider(this.lineThickNess,this.clr,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Divider(
          color: clr,
          thickness: lineThickNess,
        ));
  }
}
