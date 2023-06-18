import 'package:flutter/material.dart';
import 'package:zomato_clone/common/utils/colors.dart';
import 'package:zomato_clone/features/loginandsignup/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    offset = Tween<Offset>(
            begin: const Offset(0.0, 10.0), end: const Offset(0.0, 0.0))
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 750), () {
      controller.forward();
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (route) => false);
      });
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/splash_icon_2.png",
                  color: darkRed,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "zomato",
                  style: TextStyle(
                    fontFamily: "assets/fonts/firasans_ultra_italic.otf",
                    fontSize: 68,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "100% Green Deliveries",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: white),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Carbon and Plastic Neutral\nin India",
                  style: TextStyle(
                    color: lightPink,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 175,
                  child: SlideTransition(
                    position: offset,
                    child: Image.asset(
                      "assets/images/splash_icon_1.png",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
