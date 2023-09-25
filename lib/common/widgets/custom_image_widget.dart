import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width, required this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, child, imageChunkEvent){
          if(imageChunkEvent==null){
            return child;
          }
          double? loaded;
          if(imageChunkEvent.expectedTotalBytes!=null){
            loaded = imageChunkEvent.cumulativeBytesLoaded / imageChunkEvent.expectedTotalBytes!;
          }
          log(loaded.toString());
          return Center(
            child: CircularProgressIndicator(
              value: loaded,
            ),
          );
        },
        errorBuilder: (context, _, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: primaryColor,
              ),
              Text(
                "Some Error Occurred",
              ),
            ],
          );
        },
      ),
    );
  }
}
