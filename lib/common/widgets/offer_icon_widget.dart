import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class OfferIconWidget extends StatelessWidget {
  final double iconSize;
  const OfferIconWidget({Key? key, required this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => const RadialGradient(
        center: Alignment.centerRight,
        stops: [0.8, 1],
        colors: [
          blueColor,
          lightBlueColor,
        ],
      ).createShader(bounds),
      child: Image.asset(
        "assets/images/offer_icon.png",
        height: iconSize,
        width: iconSize,
      ),
    );
  }
}
