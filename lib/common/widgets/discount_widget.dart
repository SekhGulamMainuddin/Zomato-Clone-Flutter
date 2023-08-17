import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class DiscountWidget extends StatelessWidget {
  final String discount;
  final EdgeInsets padding;
  final double iconSize;
  final double textSize;

  const DiscountWidget({
    Key? key,
    required this.discount,
    this.iconSize = 20,
    this.textSize = 15,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: padding == EdgeInsets.zero
          ? const EdgeInsets.only(top: 8, bottom: 4)
          : padding,
      child: Row(
        children: [
          ShaderMask(
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
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            discount,
            style: textTheme.labelMedium
                ?.copyWith(fontSize: textSize, color: blueColor),
          ),
        ],
      ),
    );
  }
}
