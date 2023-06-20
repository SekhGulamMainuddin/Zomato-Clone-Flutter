import 'package:flutter/material.dart';
import 'package:zomato_clone/features/home/screens/home_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/login_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/verify_otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case VerifyOTPScreen.routeName:
      final arguments = routeSettings.arguments as Map<String, dynamic>;
      final verificationId = arguments["verificationId"] as String;
      final resendToken = arguments["resendToken"] as int?;
      final phoneNumber = arguments["phoneNumber"] as String;
      return MaterialPageRoute(
          builder: (context) =>
              VerifyOTPScreen(verificationId, resendToken, phoneNumber));
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
