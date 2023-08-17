import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/search_bar_widget.dart';
import 'package:zomato_clone/features/main_home/restaurants_and_dishes/dishes/screens/dishes_screen.dart';
import 'package:zomato_clone/features/main_home/restaurants_and_dishes/restaurants/screens/restaurants_screen.dart';

class RestaurantsAndDishesScreen extends ConsumerStatefulWidget {
  static const routeName = "/restaurants-and-dishes-screen";

  const RestaurantsAndDishesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RestaurantsAndDishesScreenState();
}

class _RestaurantsAndDishesScreenState
    extends ConsumerState<RestaurantsAndDishesScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  late List<Widget> screens;
  TextTheme? textTheme;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    screens = [
      const RestaurantsScreen(),
      const DishesScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    final tabStyle = textTheme?.labelLarge;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(bottom: 5),
                child: SearchBarWidget(
                  hint: "Biryani",
                  hintColor: darkBlack,
                  leading: Pair(
                    Icons.arrow_back_ios_new_rounded,
                    () {},
                  ),
                  onClick: () {},
                ),
              ),
              Card(
                elevation: 0.8,
                child: TabBar(
                  controller: controller,
                  indicatorWeight: 3.5,
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: darkBlack,
                  unselectedLabelColor: grey,
                  labelStyle: tabStyle,
                  onTap: (tab){
                    controller.index = tab;
                  },
                  tabs: const [
                    Tab(text: " Restaurants "),
                    Tab(text: " Dishes "),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: screens,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
