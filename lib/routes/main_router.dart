import 'package:flutter/material.dart';
import 'package:zomato_clone/features/home/delivery_location/screens/choose_delivery_location_screen.dart';
import 'package:zomato_clone/features/home/restaurant_page/screens/restaurant_page_screen.dart';
import 'package:zomato_clone/features/home/search_screen/search_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/login_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/verify_otp_screen.dart';
import 'package:zomato_clone/features/home/main_home/screens/main_home_screen.dart';
import 'package:zomato_clone/features/home/delivery_summary/screens/delivery_summary_screen.dart';
import 'package:zomato_clone/features/home/profile/screens/activity_screen.dart';
import 'package:zomato_clone/features/home/restaurants_and_dishes/restaurants_and_dishes_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  dynamic page;
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      page = const LoginScreen();
      break;
    case MainHomeScreen.routeName:
      page = const MainHomeScreen();
      break;
    case ActivityScreen.routeName:
      page = const ActivityScreen();
      break;
    case RestaurantsAndDishesScreen.routeName:
      page = const RestaurantsAndDishesScreen();
      break;
    case RestaurantPageScreen.routeName:
      page = const RestaurantPageScreen();
      break;
    case DeliverySummaryScreen.routeName:
      page = const DeliverySummaryScreen();
      break;
    case SearchScreen.routeName:
      page = const SearchScreen();
      break;
    case VerifyOTPScreen.routeName:
      final arguments = routeSettings.arguments as Map<String, dynamic>;
      final verificationId = arguments["verificationId"] as String;
      final resendToken = arguments["resendToken"] as int?;
      final phoneNumber = arguments["phoneNumber"] as String;
      page = VerifyOTPScreen(verificationId, resendToken, phoneNumber);
      break;
    case ChooseDeliveryLocationScreen.routeName:
      page = const ChooseDeliveryLocationScreen();
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
