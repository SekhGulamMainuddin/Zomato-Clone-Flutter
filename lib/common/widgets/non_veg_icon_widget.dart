import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class NonVegIconWidget extends StatelessWidget {
  final double size;

  const NonVegIconWidget({
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
      child: Image.asset(
        "assets/images/non_veg_icon.png",
        height: 10,
        width: 10,
        color: crayola,
      ),
    );
  }
}
