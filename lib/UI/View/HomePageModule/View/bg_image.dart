import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../Utils/Constants/image_constant.dart';
class BgImage extends StatelessWidget {
  String image;
  Alignment alignment;
  BgImage(this.image,this.alignment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(image),
            alignment: alignment
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
        ),
      ),
    );
  }
}
