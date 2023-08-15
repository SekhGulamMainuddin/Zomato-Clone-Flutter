import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class RecipeItemWidget extends StatelessWidget {
  final String recipeName;
  final String recipeImage;

  const RecipeItemWidget(
      {Key? key, required this.recipeName, required this.recipeImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          recipeImage,
          height: 50,
          width: 60,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          recipeName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: grey,
                fontSize: 13,
              ),
        ),
      ],
    );
  }
}
