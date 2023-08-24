import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/delivery_time_and_distance_widget.dart';
import 'package:zomato_clone/common/widgets/discount_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_name_and_rating_widget.dart';

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
  final Function(String) onClick;

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
    required this.discount, required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onClick(restaurantName),
      child: Card(
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
                    RestaurantNameAndRatingWidget(
                        restaurantName: restaurantName, rating: rating),
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
                    DeliveryTimeAndDistanceWidget(
                        deliveryTime: deliveryTime, distance: distance),
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
                    DiscountWidget(discount: discount),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
