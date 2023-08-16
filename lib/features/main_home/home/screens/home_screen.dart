import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/main_home/delivery/screens/delivery_screen.dart';
import 'package:zomato_clone/features/main_home/money/screens/money_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>{

  @override
  bool get wantKeepAlive => true;

  List<Widget> screens = [];
  var _currentPage = 0;
  var screenWidth = 0.0;
  TextTheme? textTheme;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    screens = [
      const DeliveryScreen(),
      const MoneyScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    textTheme = Theme.of(context).textTheme;
    screenWidth = MediaQuery.sizeOf(context).width * 0.35;
    return Scaffold(
      body: SafeArea(
        child: screens[_currentPage],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomNavigationItem(
              imageIcon:
                  "assets/images/delivery_${_currentPage == 0 ? "selected_" : ""}icon.png",
              label: "Delivery",
              isSelected: _currentPage == 0,
              onClick: () {
                if (_currentPage != 0) {
                  setState(() {
                    _currentPage = 0;
                  });
                }
              },
            ),
            const SizedBox(
              height: 30,
              child: VerticalDivider(
                color: midLightGrey,
              ),
            ),
            bottomNavigationItem(
              imageIcon:
                  "assets/images/wallet_${_currentPage == 1 ? "selected_" : ""}icon.png",
              label: "Money",
              isSelected: _currentPage == 1,
              onClick: () {
                if (_currentPage != 1) {
                  setState(() {
                    _currentPage = 1;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationItem({
    required String imageIcon,
    required String label,
    required bool isSelected,
    required VoidCallback onClick,
  }) =>
      Expanded(
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            color: white,
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.only(bottom: 2),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                isSelected
                    ? SizedBox(
                        width: screenWidth,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, value, _) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                              child: LinearProgressIndicator(
                                value: value,
                                minHeight: 3.5,
                                valueColor:
                                    const AlwaysStoppedAnimation(primaryColor),
                                backgroundColor: white,
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 4,
                        width: screenWidth,
                      ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      imageIcon,
                      height: 22,
                      width: 22,
                      color: isSelected ? primaryColor : grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      label,
                      style: textTheme?.titleMedium,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
}
