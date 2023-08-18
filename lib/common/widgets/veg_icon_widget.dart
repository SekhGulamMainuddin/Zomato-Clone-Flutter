import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class VegIconWidget extends StatelessWidget {
  final double size;

  const VegIconWidget({
    Key? key,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: greenColor, width: 1.5)),
      child: const Icon(
        Icons.circle,
        color: greenColor,
        size: 10,
      ),
    );
  }
}
