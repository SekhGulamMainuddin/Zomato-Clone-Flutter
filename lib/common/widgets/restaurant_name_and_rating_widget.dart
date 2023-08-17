import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class RestaurantNameAndRatingWidget extends StatelessWidget {
  final String restaurantName;
  final double rating;
  final double textSize;

  const RestaurantNameAndRatingWidget({
    Key? key,
    required this.restaurantName,
    required this.rating,
    this.textSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          restaurantName,
          style: textTheme.titleSmall?.copyWith(
            color: darkBlack,
            fontSize: textSize,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
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
        ),
      ],
    );
  }
}
