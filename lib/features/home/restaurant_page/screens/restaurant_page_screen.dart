import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/utils/utils.dart';
import 'package:zomato_clone/common/widgets/delivery_time_and_distance_widget.dart';
import 'package:zomato_clone/common/widgets/rating_widget.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/widgets/offer_widget.dart';

class RestaurantPageScreen extends ConsumerStatefulWidget {
  static const routeName = "/restaurant-page-screen";

  const RestaurantPageScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _RestaurantPageScreenState();
}

class _RestaurantPageScreenState extends ConsumerState<RestaurantPageScreen> {
  TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ghostWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: white,
            automaticallyImplyLeading: false,
            leading: actionMenuItem(
              onClick: () {},
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
                      "Rajani's Kitchen",
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
          SliverAppBar(
            backgroundColor: ghostWhite,
            pinned: true,
            titleSpacing: 0,
            flexibleSpace: Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      filterWidget(
                        label: "Veg",
                        iconWidget: const VegOrNonVegIconWidget(
                          isVeg: true,
                        ),
                      ),
                      filterWidget(
                          label: "Egg",
                          imageIcon:
                              "https://cdn-icons-png.flaticon.com/128/9925/9925409.png"),
                      filterWidget(
                        label: "Non-Veg",
                        iconWidget: const VegOrNonVegIconWidget(
                          isVeg: false,
                        ),
                      ),
                      filterWidget(
                          label: "Veg",
                          imageIcon:
                              "https://cdn-icons-png.flaticon.com/128/7601/7601227.png"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget filterWidget({
    required String label,
    String? imageIcon,
    Widget? iconWidget,
  }) =>
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            color: white,
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8).copyWith(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  children: [
                    iconWidget ??
                        Image.network(
                          imageIcon!,
                          height: 20,
                          width: 20,
                        ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      label,
                      style: textTheme?.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

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
