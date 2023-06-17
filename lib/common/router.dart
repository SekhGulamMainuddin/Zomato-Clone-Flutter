import 'package:flutter/material.dart';
import 'package:zomato_clone/features/home/screens/home_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text(
              "Page Doesn't Exists",
              style: TextStyle(fontSize: 26),
            ),
          ),
        ),
      );
  }
}
