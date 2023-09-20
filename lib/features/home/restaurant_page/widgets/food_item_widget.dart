import 'package:flutter/material.dart';
import 'package:zomato_clone/common/widgets/add_button.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';

class FoodItemWidget extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final double totalRatings;
  final int price;
  final bool isVeg;
  final String? banner;
  final Color? bannerColor;
  final bool isCustomisable;

  const FoodItemWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.totalRatings,
    required this.price,
    required this.isVeg,
    this.banner,
    this.bannerColor,
    required this.isCustomisable,
  }) : super(key: key);

  @override
  State<FoodItemWidget> createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const VegOrNonVegIconWidget(
                        isVeg: true,
                      ),
                      Container(

                      )
                    ],
                  ),

                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://www.cubesnjuliennes.com/wp-content/uploads/2020/07/Chicken-Biryani-Recipe.jpg",
                          width: width * 0.25,
                          height: width * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      width: width * 0.2,
                      child: const AddButton(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "customisable",
                  style: textTheme.labelSmall,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
