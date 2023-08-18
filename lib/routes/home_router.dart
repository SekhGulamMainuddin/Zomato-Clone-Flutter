import 'package:flutter/material.dart';
import 'package:zomato_clone/features/home/home/screens/home_screen.dart';
import 'package:zomato_clone/features/home/profile/screens/profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  dynamic page;
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      page = const HomeScreen();
      break;
    case ProfileScreen.routeName:
      page = const ProfileScreen();
      break;
    default:
      page = const Scaffold(
        body: Center(
          child: Text(
            "Page Doesn't Exists",
            style: TextStyle(fontSize: 26),
          ),
        ),
      );
  }
  return MaterialPageRoute<dynamic>(builder: (context) => page);
}
