import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/models/pair.dart';

class RestaurantItemWidget extends StatelessWidget {
  final String imageUrl;
  final String restaurantName;
  final bool isFavorite;
  final double rating;
  final String speciality;
  final String foodType;
  final double lowestPriceOfItem;
  final Pair<int, int> deliveryTime;
  final double distance;
  final String discount;

  const RestaurantItemWidget({
    Key? key,
    required this.imageUrl,
    required this.restaurantName,
    required this.isFavorite,
    required this.rating,
    required this.speciality,
    required this.foodType,
    required this.lowestPriceOfItem,
    required this.deliveryTime,
    required this.distance,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var distanceText = "";
    if(distance>=1000){
      distanceText = "${(distance*0.001).toStringAsFixed(0)} km";
    }else{
      distanceText = "$distance m";
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline_rounded,
                          color: isFavorite ? primaryColor : white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_rounded,
                          color: white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(left: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurantName,
                        style: textTheme.titleSmall
                            ?.copyWith(color: darkBlack, fontSize: 24),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
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
                              style: textTheme.titleSmall
                                  ?.copyWith(color: white, fontSize: 14),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Text(
                          speciality,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: grey.withOpacity(0.8),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.circle,
                            size: 5,
                          ),
                        ),
                        Text(
                          foodType,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: grey.withOpacity(0.8),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.circle,
                            size: 5,
                          ),
                        ),
                        Text(
                          "\u{20B9}$lowestPriceOfItem for one",
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: grey.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timelapse_rounded,
                          color: greenColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${deliveryTime.first}-${deliveryTime.second} min",
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: grey.withOpacity(0.8),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.circle,
                            size: 5,
                            color: grey,
                          ),
                        ),
                        Text(
                          distanceText,
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: grey.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      1100 ~/ 10,
                      (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0 ? Colors.transparent : midGrey,
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Row(
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (Rect bounds) => const RadialGradient(
                            center: Alignment.centerRight,
                            stops: [0.8, 1],
                            colors: [
                              blueColor,
                              lightBlueColor,
                            ],
                          ).createShader(bounds),
                          child: Image.asset(
                            "assets/images/offer_icon.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          discount,
                          style: textTheme.labelMedium
                              ?.copyWith(fontSize: 15, color: blueColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
