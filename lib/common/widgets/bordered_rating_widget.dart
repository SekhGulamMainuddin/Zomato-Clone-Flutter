import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/star_rating.dart';

class BorderedRatingWidget extends StatefulWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color color;
  final double size;

  const BorderedRatingWidget({
    Key? key,
    this.starCount = 5,
    this.rating = .0,
    this.onRatingChanged,
    required this.color,
    this.size = 25,
  }) : super(key: key);

  @override
  State<BorderedRatingWidget> createState() => _BorderedRatingWidgetState();
}

class _BorderedRatingWidgetState extends State<BorderedRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: yellowColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: yellowColor.withOpacity(0.3))),
      child: StarRating(
        color: widget.color,
        size: widget.size,
        onRatingChanged: widget.onRatingChanged,
        rating: widget.rating,
        starCount: widget.starCount,
      ),
    );
  }
}
