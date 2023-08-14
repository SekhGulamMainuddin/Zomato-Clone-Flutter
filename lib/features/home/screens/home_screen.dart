import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/delivery/screens/delivery_screen.dart';
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
  List<Widget> screens = [];
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    screens = [
      const DeliveryScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: screens[_currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                border: Border(
                  right: BorderSide(color: white, width: 0.5)
                )
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  border: Border(
                      left: BorderSide(color: white, width: 0.5)
                  )
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
