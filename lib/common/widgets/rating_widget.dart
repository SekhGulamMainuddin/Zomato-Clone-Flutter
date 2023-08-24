import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  const RatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
      decoration: BoxDecoration(
        color: rating > 3
            ? greenColor
            : rating > 2
            ? yellowColor
            : primaryColor,
        borderRadius: BorderRadius.circular(7),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Text(
            rating.toStringAsFixed(1),
            style:
            textTheme.titleSmall?.copyWith(color: white, fontSize: 14),
          ),
          const SizedBox(
            width: 2,
          ),
          const Icon(
            Icons.star,
            color: white,
            size: 14,
          ),
        ],
      ),
    );
  }
}
