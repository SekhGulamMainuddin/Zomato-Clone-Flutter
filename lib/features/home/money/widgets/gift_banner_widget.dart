import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class GiftBannerWidget extends StatefulWidget {
  const GiftBannerWidget({Key? key}) : super(key: key);

  @override
  State<GiftBannerWidget> createState() => _GiftBannerWidgetState();
}

class _GiftBannerWidgetState extends State<GiftBannerWidget> {
  late Timer timer;
  final pageController = PageController(initialPage: 0);
  final bannerList = [
    "assets/images/gift_card_banner.jpg",
    "assets/images/zomato_gold_gift_card.png",
    "assets/images/zomato_regular_gift_card.png"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer = Timer.periodic(const Duration(seconds: 3), (t) {
        pageController.jumpToPage(
          ((pageController.page!.toInt() + 1) % 3)
        );
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          SizedBox(
            height: 170,
            width: double.infinity,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  bannerList[index],
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Text(
              "Buy now",
              style: textTheme.labelSmall?.copyWith(color: primaryColor),
            ),
            label: const Icon(
              Icons.arrow_forward,
              size: 16,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
