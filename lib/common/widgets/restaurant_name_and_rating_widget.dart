import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/rating_widget.dart';

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
        RatingWidget(
          rating: rating,
        ),
      ],
    );
  }
}
