import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/offer_icon_widget.dart';

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
          OfferIconWidget(
            iconSize: iconSize,
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
