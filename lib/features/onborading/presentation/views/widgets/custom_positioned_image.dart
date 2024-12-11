import 'package:flutter/material.dart';

class CustomPositionedImage extends StatelessWidget {
  const CustomPositionedImage({
    super.key,
    required this.bottom,
    required this.left,
    required this.right,
    required this.height,
    required this.width,
    required this.imagePath,
  });
  final double bottom, left, right, height, width;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imagePath,
            height: height,
            width: width,
          ),
        ],
      ),
    );
  }
}
