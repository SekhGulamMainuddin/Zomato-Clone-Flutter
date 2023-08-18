import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/add_filter_widget.dart';
import 'package:zomato_clone/common/widgets/restaurant_with_dishes_item_widget.dart';
import 'package:zomato_clone/features/home/home/widgets/recipe_item_widget.dart';

class DishesScreen extends ConsumerStatefulWidget {
  const DishesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DishesScreenState();
}

class _DishesScreenState extends ConsumerState<DishesScreen>
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
            padding: const EdgeInsets.only(top: 30, bottom: 16),
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
          itemCount: 1000,
          itemBuilder: (context, index) => const RestaurantWithDishesItemWidget(),
        ),
      ],
    );
  }
}
