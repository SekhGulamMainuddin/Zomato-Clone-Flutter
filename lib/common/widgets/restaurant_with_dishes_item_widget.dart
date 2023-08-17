import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/delivery_time_and_distance_widget.dart';
import 'package:zomato_clone/common/widgets/discount_widget.dart';
import 'package:zomato_clone/common/widgets/dishes_item_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_name_and_rating_widget.dart';

class RestaurantWithDishesItemWidget extends StatefulWidget {
  const RestaurantWithDishesItemWidget({Key? key}) : super(key: key);

  @override
  State<RestaurantWithDishesItemWidget> createState() =>
      _RestaurantWithDishesItemWidgetState();
}

class _RestaurantWithDishesItemWidgetState
    extends State<RestaurantWithDishesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
      decoration: BoxDecoration(
        color: white,
          borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(1, 1.5)
          )
        ]
      ),
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: RestaurantNameAndRatingWidget(
              restaurantName: "DFC Dada's Biryani",
              rating: 4.5,
              textSize: 22,
            ),
          ),
          DeliveryTimeAndDistanceWidget(
            deliveryTime: Pair(35, 30),
            distance: 3000,
            textColor: black,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          ),
          const DiscountWidget(
            discount: "50% OFF up to 100",
            textSize: 14,
            iconSize: 14,
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 7.5).copyWith(top: 12),
              itemBuilder: (context, index) => const DishesItemWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
