import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/best_seller_widget.dart';
import 'package:zomato_clone/common/widgets/bordered_rating_widget.dart';
import 'package:zomato_clone/common/widgets/custom_image_widget.dart';
import 'package:zomato_clone/common/widgets/item_counter_widget.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';

class BuyFoodItemBottomSheetScreen extends StatefulWidget {
  const BuyFoodItemBottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BuyFoodItemBottomSheetScreen> createState() =>
      _BuyFoodItemBottomSheetScreenState();
}

class _BuyFoodItemBottomSheetScreenState
    extends State<BuyFoodItemBottomSheetScreen> {
  final quantityNameAndPrice = [
    Pair("Small", 162),
    Pair("Medium", 216),
    Pair("Large", 405),
  ];

  var selectedQuantity = 0;
  var totalNumberCount = 1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: const CircleBorder(),
            color: darkBlack,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: white,
                size: 28,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              color: ghostWhite,
            ),
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 14).copyWith(
              top: 15,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const CustomImageWidget(
                          imageUrl:
                              "https://static.toiimg.com/thumb/54308405.cms?imgsize=510571&width=800&height=800",
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          VegOrNonVegIconWidget(
                            isVeg: false,
                            size: 18,
                          ),
                          BestSellerWidget(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 8),
                                    child: Text(
                                      "Hyderabadi Chicken Dum Biryani",
                                      style: textTheme.titleSmall
                                          ?.copyWith(fontSize: 18),
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      const BorderedRatingWidget(
                                        color: yellowColor,
                                        rating: 3.75,
                                        size: 16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3),
                                        child: Text(
                                          "875 ratings",
                                          style: textTheme.labelSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      side: const BorderSide(color: lightGrey),
                                      backgroundColor: white,
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.favorite_border_rounded,
                                      color: primaryColorVariant,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      side: const BorderSide(color: lightGrey),
                                      padding: EdgeInsets.zero,
                                      backgroundColor: white,
                                      minimumSize: Size.zero),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Image.asset(
                                      "assets/images/share_icon.png",
                                      color: primaryColorVariant,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: lightGrey,
                        ))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Size",
                                  style: textTheme.labelLarge?.copyWith(
                                    fontSize: 17,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: bigFootFeet.withOpacity(0.7)),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  child: Text(
                                    "REQUIRED",
                                    style: textTheme.bodyLarge?.copyWith(
                                        color: bigFootFeet, fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "Select any 1 option",
                              style: textTheme.labelSmall?.copyWith(
                                color: midLightGrey,
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                            3,
                            (index) => Material(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedQuantity = index;
                                  });
                                },
                                splashColor: primarySwatch[100],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        quantityNameAndPrice[index].first,
                                        style: selectedQuantity == index
                                            ? textTheme.labelLarge
                                                ?.copyWith(fontSize: 17)
                                            : textTheme.labelMedium
                                                ?.copyWith(fontSize: 17),
                                      ),
                                      const Spacer(),
                                      if (selectedQuantity != index)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            "+₹${quantityNameAndPrice[index].second - quantityNameAndPrice[selectedQuantity].second}",
                                            style: textTheme.labelMedium
                                                ?.copyWith(fontSize: 17),
                                          ),
                                        ),
                                      Icon(
                                        selectedQuantity == index
                                            ? Icons.radio_button_checked_rounded
                                            : Icons.radio_button_off_rounded,
                                        color: selectedQuantity == index
                                            ? primaryColorVariant
                                            : midLightGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            color: white,
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: ItemCounterWidget(
                    height: 50,
                    counter: (count) {
                      totalNumberCount = count;
                    },
                    currentCounter: totalNumberCount,
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: primaryColorVariant,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Add item ₹${totalNumberCount * quantityNameAndPrice[selectedQuantity].second}",
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
