import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/home/widgets/add_filter_widget.dart';
import 'package:zomato_clone/features/home/widgets/restaurant_item_widget.dart';
import 'package:zomato_clone/features/home/widgets/recipe_item_widget.dart';
import 'package:zomato_clone/models/pair.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var location = "Cuttack";
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0).copyWith(top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: primaryColor,
                  size: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: location,
                                  style: textTheme.displaySmall),
                              const WidgetSpan(
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "India",
                        style: textTheme.labelSmall?.copyWith(
                          color: grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  splashColor: lightGrey,
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.symmetric(vertical: 5)
                        .copyWith(right: 2, left: 1),
                    decoration: const BoxDecoration(
                        color: transparent,
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: midGrey,
                            width: 1,
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      "assets/images/change_language_icon.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                    radius: 19,
                    backgroundColor: white,
                    backgroundImage: CachedNetworkImageProvider(
                        "https://cdn.pixabay.com/photo/2018/02/08/22/27/flower-3140492_1280.jpg")),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          border: Border.fromBorderSide(
                            BorderSide(color: lightGrey.withOpacity(0.8), width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search_rounded,
                                color: primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: grey, width: 1)),
                                ),
                                child: Text(
                                  "Restaurant name or a dish...",
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: midLightGrey,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic_none,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        height: 140,
                        width: double.infinity,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/zomato_offer_icon.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 110,
                        padding: const EdgeInsets.all(15).copyWith(right: 0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          border: Border.fromBorderSide(
                            BorderSide(color: lightGrey.withOpacity(0.8), width: 1),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Offers",
                                  style: textTheme.displaySmall,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Up to 60% OFF, Flat Discounts, and other great offers",
                                    style: textTheme.labelMedium?.copyWith(
                                      color: midLightGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Lottie.asset(
                              "assets/lottie/offers_animation.json",
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: lightGrey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "WHAT'S ON YOUR MIND?",
                                style: textTheme.bodyLarge?.copyWith(
                                  fontSize: 14,
                                  color: grey,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 215,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(right: 15),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                children: [
                                  RecipeItemWidget(
                                    recipeName: "Biryani",
                                    recipeImage: "assets/images/biryani_icon.png",
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  RecipeItemWidget(
                                    recipeName: "Fired Rice",
                                    recipeImage: "assets/images/fried_rice.png",
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: lightGrey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "ALL RESTAURANTS",
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                color: grey,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(right: 15).copyWith(left: 5),
                    scrollDirection: Axis.horizontal,
                    children: [
                      AddFilterWidget(
                        icon: "assets/images/filter_icon.png",
                        tag: "Sort",
                        hasMultiOption: true,
                        onClick: () {},
                      ),
                      AddFilterWidget(tag: "Nearest", onClick: () {}),
                      AddFilterWidget(tag: "Rating 4.0+", onClick: () {}),
                      AddFilterWidget(tag: "Pure Veg", onClick: () {}),
                      AddFilterWidget(tag: "New Arrivals", onClick: () {}),
                      AddFilterWidget(
                          tag: "Cuisines", hasMultiOption: true, onClick: () {})
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "11 restaurants delivering to you",
                    style: textTheme.bodyLarge?.copyWith(
                      color: midLightGrey,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: 100000,
            itemBuilder: (context, index) {
              return RestaurantItemWidget(
                imageUrl:
                "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg",
                restaurantName: "Anjana Restaurant",
                isFavorite: Random().nextBool(),
                rating: (Random().nextInt(10).toDouble()+(Random().nextDouble()%5))%5,
                speciality: Random().nextBool() ? "Biryani" : "Indian",
                foodType:
                Random().nextBool() ? "North Indian" : "South Indian",
                lowestPriceOfItem: Random().nextInt(5000).toDouble(),
                deliveryTime:
                Pair(Random().nextInt(50), Random().nextInt(120)),
                distance: Random().nextInt(50000).toDouble(),
                discount:
                "${Random().nextInt(60)}% OFF up to ${Random().nextInt(100)}",
              );
            },
          ),
        ],
      ),
      backgroundColor: white,
    );
  }
}
