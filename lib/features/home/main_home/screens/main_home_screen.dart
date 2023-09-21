import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/features/home/home/screens/home_screen.dart';
import 'package:zomato_clone/features/home/profile/screens/profile_screen.dart';
import 'package:zomato_clone/navigation/navigation.dart';

class MainHomeScreen extends ConsumerStatefulWidget {
  static const routeName = "/main-home-screen";

  const MainHomeScreen({super.key});

  @override
  ConsumerState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends ConsumerState<MainHomeScreen> {

  final pageController = PageController();
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomeScreen(),
      const ProfileScreen(),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listenManual(homeNavigation, (previous, next) {
        pageController.jumpToPage(next);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageController.page!.round() == pageController.initialPage) {
          return true;
        } else {
          pageController.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
          ref
              .watch(homeNavigation.notifier)
              .state = 0;
          return false;
        }
      },
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
      ),
    );
  }
}
