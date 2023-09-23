import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color color;
  final double size;


  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = .0,
    this.onRatingChanged,
    required this.color,
    this.size = 25,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= widget.rating) {
      icon = Icon(
        Icons.star_border,
        color: widget.color,
        size: widget.size,
      );
    } else if (index > widget.rating - 1 && index < widget.rating) {
      icon = Icon(
        Icons.star_half,
        color: widget.color,
        size: widget.size,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: widget.color,
        size: widget.size,
      );
    }
    return InkResponse(
      onTap: widget.onRatingChanged == null
          ? null
          : () => widget.onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.starCount,
            (index) => buildStar(context, index),
      ),
    );
  }
}
