import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String imageLink;
  final double radius;

  const CircularImage({
    Key? key,
    required this.imageLink,
    this.radius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(
        imageLink,
      ),
    );
  }
}
