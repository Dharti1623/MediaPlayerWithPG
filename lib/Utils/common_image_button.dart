
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageButton extends StatelessWidget {
  double width;
  double height;
  String image;
  Null Function() onTap;
  ImageButton({Key? key, required this.width, required this.height, required this.image, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap:onTap,
          child: Container(
              width:width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image:AssetImage(image),
                    fit:BoxFit.cover
                ),
              )
          ),
      ),
    );
  }
}
