import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/add_filter_widget.dart';
import 'package:zomato_clone/features/home/home/widgets/recipe_item_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_item_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/screens/restaurant_page_screen.dart';

class RestaurantsScreen extends ConsumerStatefulWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends ConsumerState<RestaurantsScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  var _currentSelectedItem = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 15, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Container(
            height: 50,
            color: white,
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(right: 15).copyWith(left: 6),
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
              ],
            ),
          ),
          backgroundColor: white,
          elevation: 0,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: TabBar(
              padding: const EdgeInsets.only(left: 10),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              controller: controller,
              isScrollable: true,
              indicatorColor: primaryColor,
              indicatorWeight: 2.5,
              tabs: List.generate(
                15,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RecipeItemWidget(
                    recipeName: "Biryani",
                    recipeImage: "assets/images/biryani_icon.png",
                    isSelected: _currentSelectedItem == index,
                  ),
                ),
              ),
              onTap: (tab) {
                setState(() {
                  controller.index = tab;
                  _currentSelectedItem = tab;
                });
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 14),
            child: Text(
              "ALL RESTAURANTS\nDELIVERING BIRYANI",
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                color: grey,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 100000,
          itemBuilder: (context, index) {
            return RestaurantItemWidget(
              imageUrl: Random().nextBool() && Random().nextBool()
                  ? "https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?cs=srgb&dl=pexels-saveurs-secretes-5560763.jpg&fm=jpg"
                  : Random().nextBool()
                      ? "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg?w=2000"
                      : Random().nextBool()
                          ? "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg"
                          : "https://recipesblob.oetker.in/assets/6c0ac2f3ce204d3d9bb1df9709fc06c9/636x380/shahi-paneer.jpg",
              restaurantName: "Anjana Restaurant",
              isFavorite: Random().nextBool(),
              rating: (Random().nextInt(10).toDouble() +
                      (Random().nextDouble() % 5)) %
                  5,
              speciality: Random().nextBool() ? "Biryani" : "Indian",
              foodType: Random().nextBool() ? "North Indian" : "South Indian",
              lowestPriceOfItem: Random().nextInt(5000).toDouble(),
              deliveryTime:
                  Pair(Random().nextInt(50), Random().nextInt(70) + 50),
              distance: Random().nextInt(50000).toDouble(),
              discount:
                  "${Random().nextInt(60)}% OFF up to ${Random().nextInt(100)}",
              onClick: (restaurant){
                // Navigator.of(context, rootNavigator: true).pushNamed(RestaurantPageScreen.routeName);
              },
            );
          },
        ),
      ],
    );
  }
}
