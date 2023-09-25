import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class BestSellerWidget extends StatelessWidget {
  final double size;
  const BestSellerWidget({Key? key, this.size = 11}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: gamboge,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "Bestseller",
        style: textTheme.labelSmall?.copyWith(
          color: white,
          fontSize: size,
        ),
      ),
    );
  }
}
