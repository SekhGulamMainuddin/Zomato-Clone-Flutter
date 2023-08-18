import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/loginandsignup/controller/login_signup_controller.dart';
import 'package:zomato_clone/features/home/profile/widgets/profile_header_widget.dart';
import 'package:zomato_clone/routes/navigation.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const routeName = "/profile-screen";

  const ProfileScreen({super.key});

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  TextTheme? textTheme;
  final baseImageLocation = "assets/images/";

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: ColoredBox(
        color: ghostWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                ref.watch(homeNavigation.notifier).state = 0;
              },
              icon: const Icon(
                Icons.arrow_back,
                color: black,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: ref.read(loginSignUpControllerProvider).isUserSigned ? 155 : 115,
                            ),
                            likesPaymentsSettingsWidget(),
                            const SizedBox(
                              height: 12,
                            ),
                            listItemLabelWidget(
                              icon: Icons.cached,
                              label: "App update available",
                              iconSize: 22,
                              onClick: () {},
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            listItemLabelWidget(
                              icon: Icons.person_outline_rounded,
                              label: "Your profile",
                              iconSize: 22,
                              extraWidget: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 4),
                                decoration: BoxDecoration(
                                  color: honeydew,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "100% completed",
                                  style: textTheme?.labelMedium?.copyWith(
                                    fontSize: 12,
                                    color: greenColor,
                                  ),
                                ),
                              ),
                              onClick: () {},
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            listItemLabelWidget(
                              icon: Icons.star_border,
                              label: "Your rating",
                              iconSize: 22,
                              extraWidget: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: culturedColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "--",
                                      style: textTheme?.labelMedium?.copyWith(
                                        fontSize: 14,
                                        color: manatee,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: manatee,
                                    ),
                                  ],
                                ),
                              ),
                              onClick: () {},
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: foodOrdersSection(),
                            ),
                            couponsSection(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: tableBookingsSection(),
                            ),
                            moneySection(),
                            Padding(
                              padding: const EdgeInsets.only(top: 12, bottom: 100),
                              child: moreSection(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const ProfileHeader(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget likesPaymentsSettingsWidget() => Row(
        children: [
          clickableIconLabel(
            label: "Likes",
            imageIcon: "assets/images/likes_icon.png",
            onClick: () {
              print("Likes Clicked");
            },
          ),
          const SizedBox(
            width: 12,
          ),
          clickableIconLabel(
            label: "Payments",
            imageIcon: "assets/images/payment_icon.png",
            size: 30,
            onClick: () {
              print("Payments Clicked");
            },
          ),
          const SizedBox(
            width: 12,
          ),
          clickableIconLabel(
            label: "Settings",
            imageIcon: "assets/images/setting_icon.png",
            onClick: () {
              print("Settings Clicked");
            },
          ),
        ],
      );

  Widget clickableIconLabel(
          {required String label,
          required String imageIcon,
          required VoidCallback onClick,
          double size = 25}) =>
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            color: white,
            child: InkWell(
              onTap: onClick,
              splashColor: lightGrey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset(
                      imageIcon,
                      height: size,
                      width: size,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      label,
                      style: textTheme?.labelSmall?.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget listItemLabelWidget({
    String? imageIcon,
    IconData? icon,
    required String label,
    Widget? extraWidget,
    double iconSize = 18,
    required VoidCallback onClick,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          child: InkWell(
            onTap: onClick,
            splashColor: lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: culturedColor,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: imageIcon != null
                          ? Image.asset(
                              imageIcon,
                              fit: BoxFit.fill,
                              height: 18,
                              color: manatee,
                            )
                          : Icon(
                              icon,
                              color: manatee,
                              size: iconSize,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        label,
                        style: textTheme?.labelSmall?.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  if (extraWidget != null) extraWidget,
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: manatee,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget headerItem({
    required String title,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 3.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primaryColor,
              ),
              margin: const EdgeInsets.only(right: 8),
            ),
            Text(
              title,
              style: textTheme?.labelMedium?.copyWith(fontSize: 16),
            ),
          ],
        ),
      );

  Widget addBorderSection(Widget widget_) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ColoredBox(
          color: white,
          child: widget_,
        ),
      );

  Widget foodOrdersSection() => addBorderSection(
        Column(
          children: [
            headerItem(title: "Food Orders"),
            listItemLabelWidget(
              label: "Your orders",
              imageIcon: "${baseImageLocation}delivery_packet_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Favorite orders",
              imageIcon: "${baseImageLocation}likes_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Address book",
              imageIcon: "${baseImageLocation}address_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Hidden Restaurants",
              icon: Icons.visibility_off_outlined,
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Online ordering help",
              imageIcon: "${baseImageLocation}chat.png",
              onClick: () {},
            ),
          ],
        ),
      );

  Widget couponsSection() => addBorderSection(
        Column(
          children: [
            headerItem(title: "Coupons"),
            listItemLabelWidget(
              label: "Collected coupons",
              imageIcon: "${baseImageLocation}discount.png",
              extraWidget: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: lavenderBlush,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "new",
                  style: textTheme?.labelMedium?.copyWith(
                    fontSize: 12,
                    color: primaryColor,
                  ),
                ),
              ),
              onClick: () {},
            ),
          ],
        ),
      );

  Widget tableBookingsSection() => addBorderSection(
        Column(
          children: [
            headerItem(title: "Table Bookings"),
            listItemLabelWidget(
              label: "Your bookings",
              imageIcon: "${baseImageLocation}booked_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Table booking help",
              imageIcon: "${baseImageLocation}chat.png",
              onClick: () {},
            ),
          ],
        ),
      );

  Widget moneySection() => addBorderSection(
        Column(
          children: [
            headerItem(title: "Money"),
            listItemLabelWidget(
              label: "Buy Gift Card",
              imageIcon: "${baseImageLocation}gift_card_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Claim Gift Card",
              imageIcon: "${baseImageLocation}claim_gift_cards_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Gift Card order history",
              icon: Icons.history_toggle_off_rounded,
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Zomato Credits",
              imageIcon: "${baseImageLocation}zomato_credits_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Gift Cards help",
              imageIcon: "${baseImageLocation}chat.png",
              onClick: () {},
            ),
          ],
        ),
      );

  Widget moreSection() => addBorderSection(
        Column(
          children: [
            headerItem(title: "More"),
            listItemLabelWidget(
              label: "Choose language",
              imageIcon: "${baseImageLocation}change_language_icon.png",
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "About",
              icon: Icons.info_outline,
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Send feedback",
              icon: Icons.edit_square,
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Report a safety emergency",
              icon: Icons.error_outline,
              onClick: () {},
            ),
            listItemLabelWidget(
              label: "Log out",
              icon: Icons.power_settings_new_rounded,
              onClick: () {},
            ),
          ],
        ),
      );
}
