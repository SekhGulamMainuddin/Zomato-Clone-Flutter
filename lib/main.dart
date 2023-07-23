import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/router.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/home/screens/home_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/username_screen.dart';
import 'package:zomato_clone/features/loginandsignup/screens/verify_otp_screen.dart';
import 'package:zomato_clone/features/splash/splash_screen.dart';
import 'package:zomato_clone/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const displayTextStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 22,
      color: black,
    );
    const titleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: black,
    );
    const labelTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: black,
    );
    const bodyTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: black,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "custom_font",
        textTheme: TextTheme(
          displayLarge: displayTextStyle,
          displayMedium: displayTextStyle.copyWith(
            fontSize: 20,
          ),
          displaySmall: displayTextStyle.copyWith(
            fontSize: 18,
          ),
          titleLarge: titleTextStyle,
          titleMedium: titleTextStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          titleSmall: titleTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          labelLarge: labelTextStyle,
          labelMedium: labelTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          labelSmall: labelTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
            fontSize: 14,
          ),
          bodyLarge: bodyTextStyle,
          bodyMedium: bodyTextStyle.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          bodySmall: bodyTextStyle.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 14,
          ),
        ),
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: white,
        primaryColor: primaryColor,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: primaryColor),
      ),
      home: const HomeScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
