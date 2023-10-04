import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/utils/utils.dart';
import 'package:zomato_clone/common/widgets/delivery_time_and_distance_widget.dart';
import 'package:zomato_clone/common/widgets/rating_widget.dart';
import 'package:zomato_clone/features/home/delivery_summary/screens/delivery_summary_screen.dart';
import 'package:zomato_clone/features/home/restaurant_page/widgets/expandable_menu_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/widgets/filter_list_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/widgets/offer_widget.dart';

final itemBarController = StateProvider((ref) => 0);

class RestaurantPageScreen extends ConsumerStatefulWidget {
  static const routeName = "/restaurant-page-screen";

  const RestaurantPageScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RestaurantPageScreenState();
}

class _RestaurantPageScreenState extends ConsumerState<RestaurantPageScreen>
    with TickerProviderStateMixin {
  TextTheme? textTheme;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  _toggleItemAddedContainer() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(seconds: 1));
    }
  }


  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    if(ref.watch(itemBarController)>0){
      _toggleItemAddedContainer();
    };
    return Scaffold(
      backgroundColor: ghostWhite,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: white,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  leading: actionMenuItem(
                    onClick: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_ios_rounded,
                  ),
                  actions: [
                    actionMenuItem(
                      onClick: () {},
                      imageIcon: "assets/images/search_icon.png",
                    ),
                    actionMenuItem(
                      onClick: () {},
                      imageIcon: "assets/images/likes_icon.png",
                    ),
                    actionMenuItem(
                      onClick: () {},
                      imageIcon: "assets/images/share_icon.png",
                    ),
                    actionMenuItem(
                      onClick: () {},
                      icon: Icons.more_vert,
                      padding: const EdgeInsets.symmetric(vertical: 6)
                          .copyWith(left: 7, right: 9),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 25)
                        .copyWith(top: 20, bottom: 15),
                    color: white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Anjana Restaurant",
                            style: textTheme?.titleSmall?.copyWith(
                              color: darkBlack,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Biryani",
                              style: textTheme?.bodyLarge?.copyWith(
                                fontSize: 14,
                                color: grey.withOpacity(0.8),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.circle,
                                size: 2,
                                color: grey.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              "North Indian",
                              style: textTheme?.bodyLarge?.copyWith(
                                fontSize: 14,
                                color: grey.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const RatingWidget(rating: 4.2),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "4.7K reviews",
                                style: textTheme?.labelSmall
                                    ?.copyWith(
                                      color: darkBlack.withOpacity(0.85),
                                    )
                                    .underlined(
                                        distance: 2,
                                        style: TextDecorationStyle.dashed),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ghostWhite,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DeliveryTimeAndDistanceWidget(
                                  deliveryTime: Pair(30, 35),
                                  distance: 2000,
                                  textColor: darkBlack,
                                  addPadding: false,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: VerticalDivider(
                                    color: black.withOpacity(0.65),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Mal Godown Market",
                                    style: textTheme?.labelSmall?.copyWith(
                                      color: darkBlack.withOpacity(0.85),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const OfferWidget(),
                const SliverAppBar(
                  backgroundColor: ghostWhite,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  toolbarHeight: 31,
                  flexibleSpace: FilterListWidget(),
                ),
                SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ExpandableMenuWidget();
                  },
                ),
              ],
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.vertical,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white38, width: 2.5),
                        ),
                        margin: const EdgeInsets.only(right: 15),
                        child: const Icon(
                          Icons.check_circle,
                          color: white,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Congrats! You can apply coupon TRYNEW to get 10% OFF up to ₹40",
                          style: textTheme?.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/images/item_added_bag_icon.png",
                        height: 30,
                        width: 30,
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10)),
                        icon: Text(
                          "1 ITEM ADDED",
                          style: textTheme?.labelLarge?.copyWith(fontSize: 14),
                        ),
                        label: const SizedBox(
                          width: 5,
                          child: Icon(
                            Icons.arrow_drop_up,
                            color: primaryColorVariant,
                            size: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, DeliverySummaryScreen.routeName);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: primaryColorVariant,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next",
                                style: textTheme?.labelLarge?.copyWith(
                                  fontSize: 16,
                                  color: white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                                child: Icon(
                                  Icons.arrow_right,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget actionMenuItem({
    required VoidCallback onClick,
    IconData? icon,
    String? imageIcon,
    EdgeInsets? padding,
  }) =>
      IconButton(
        onPressed: onClick,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
        constraints: const BoxConstraints(),
        icon: icon == null
            ? Image.asset(
                imageIcon!,
                height: 24,
                width: 24,
                color: black,
              )
            : Icon(
                icon,
                color: black,
                size: 24,
              ),
      );
}
