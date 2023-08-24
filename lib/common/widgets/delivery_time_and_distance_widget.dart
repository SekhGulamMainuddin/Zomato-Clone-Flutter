import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';

class DeliveryTimeAndDistanceWidget extends StatelessWidget {
  final Pair<int, int> deliveryTime;
  final double distance;
  final Color? textColor;
  final EdgeInsets padding;
  final bool addPadding;

  const DeliveryTimeAndDistanceWidget({
    Key? key,
    required this.deliveryTime,
    required this.distance,
    this.textColor,
    this.padding = EdgeInsets.zero,
    this.addPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var distanceText = "";
    if (distance >= 1000) {
      distanceText = "${(distance * 0.001).toStringAsFixed(0)} km";
    } else {
      distanceText = "$distance m";
    }
    return Padding(
      padding: padding == EdgeInsets.zero && addPadding
          ? const EdgeInsets.only(top: 2, bottom: 8)
          : padding,
      child: Row(
        children: [
          const Icon(
            Icons.timelapse_rounded,
            color: greenColor,
            size: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "${deliveryTime.first}-${deliveryTime.second} min",
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              color: textColor ?? grey.withOpacity(0.8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.circle,
              size: 5,
              color: textColor ?? grey,
            ),
          ),
          Text(
            distanceText,
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              color: textColor ?? grey.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
