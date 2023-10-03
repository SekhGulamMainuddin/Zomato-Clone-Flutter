import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/custom_dashed_divider.dart';
import 'package:zomato_clone/common/widgets/offer_icon_widget.dart';
import 'package:zomato_clone/features/home/delivery_summary/widgets/add_more_items_and_cooking_instructions_widget.dart';
import 'package:zomato_clone/features/home/delivery_summary/widgets/added_items_widget.dart';
import 'package:zomato_clone/features/home/delivery_summary/widgets/tip_widget.dart';

class DeliverySummaryScreen extends StatefulWidget {
  static const routeName = "/delivery-summary-screen";

  const DeliverySummaryScreen({Key? key}) : super(key: key);

  @override
  State<DeliverySummaryScreen> createState() => _DeliverySummaryScreenState();
}

class _DeliverySummaryScreenState extends State<DeliverySummaryScreen> {
  TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ghostWhite,
      appBar: AppBar(
        title: Text(
          "Bawarchi Restaurant",
          style: textTheme?.labelMedium?.copyWith(fontSize: 18),
        ),
        backgroundColor: ghostWhite,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: black,
          ),
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: savedOnThisOrderBannerGradient,
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 22,
                    child: Lottie.asset(
                      "assets/lottie/celebrate_emoji_animation.json",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You saved ₹88 on this order",
                          style: textTheme?.titleSmall
                              ?.copyWith(fontSize: 18, color: blueColor),
                        ),
                        Text(
                          "Including your Gold savings of ₹9",
                          style: textTheme?.labelSmall
                              ?.copyWith(fontSize: 14, color: blueColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: lightGrey),
                color: white,
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/images/deliver_on_time_icon.png",
                    width: 60,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery in 40-50 min",
                          style: textTheme?.labelMedium,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Get a coupon of up to 100% of your order value if we are not on time",
                          style: textTheme?.labelSmall?.copyWith(
                              color: grey.withOpacity(0.85), height: 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            headerItem("ITEM(S) ADDED"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    AddedItemsWidget(
                      foodName: "Bawarchi Special Veg Thali",
                      foodDesc: "Veg Hot N Sour Soup",
                      price: 443.15,
                      isEditable: true,
                      itemCount: 1,
                    ),
                    AddedItemsWidget(
                      foodName: "Dar Fry",
                      price: 79,
                      itemCount: 1,
                      isFree: true,
                    ),
                  ],
                ),
              ),
            ),
            const AddMoreItemsAndCookingInstructionsWidget(),
            headerItem("SAVINGS CORNER", topPadding: 15, bottomPadding: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: OfferIconWidget(iconSize: 24),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Save ₹200 more on this order",
                                  style: textTheme?.labelMedium
                                      ?.copyWith(fontSize: 16),
                                ),
                                Text(
                                  "Code: FLATSLASH",
                                  style: textTheme?.labelSmall?.copyWith(
                                      fontSize: 15,
                                      color: grey.withOpacity(0.7),
                                      height: 1.7),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(),
                          child: Text(
                            "Apply",
                            style: textTheme?.labelSmall?.copyWith(
                                color: primaryColorVariant, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(top: 14),
                    child: const CustomDashedDivider(
                      size: 5,
                      color: lightGrey,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20)))),
                    icon: Text(
                      "View all coupons",
                      style: textTheme?.labelMedium?.copyWith(
                        color: darkGrey,
                      ),
                    ),
                    label: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: white),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: lightGreenColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Added 1 free Dal Fry!",
                        style: textTheme?.labelMedium,
                      ),
                    ),
                  ),
                  Text(
                    "- ₹79.00",
                    style: textTheme?.labelSmall?.copyWith(
                      color: blueColor,
                    ),
                  )
                ],
              ),
            ),
            headerItem("BILL SUMMARY", topPadding: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Subtotal",
                        style: textTheme?.titleSmall?.copyWith(fontSize: 18),
                      ),
                      const Spacer(),
                      lineThroughText(
                        "₹523.15",
                        fontSize: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "₹444.15",
                        style: textTheme?.bodyLarge?.copyWith(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "includes ₹1 Fedding India donation",
                    style: textTheme?.labelSmall
                        ?.copyWith(color: grey.withOpacity(0.7), fontSize: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.account_balance_rounded,
                        size: 18,
                        color: darkGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          "GST and restaurant charges",
                          style: textTheme?.labelSmall?.copyWith(
                            color: darkGrey,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.info_outlined,
                        size: 18,
                        color: darkGrey,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Spacer(),
                      Text(
                        "₹28.16",
                        style: textTheme?.labelSmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/delivery_selected_icon.png",
                        width: 18,
                        color: darkGrey,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery partner fee",
                                style: textTheme?.labelSmall?.copyWith(
                                  color: darkGrey,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(
                                    color: midLightGrey.withOpacity(0.5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "See how this is calculated",
                                      style: textTheme?.labelSmall?.copyWith(
                                        color: darkGrey,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      lineThroughText("₹9"),
                      freeText()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4)
                        .copyWith(top: 7, bottom: 12),
                    child: const CustomDashedDivider(
                      size: 5,
                      color: lightGrey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Grand Total",
                        style: textTheme?.titleSmall?.copyWith(fontSize: 16),
                      ),
                      Text(
                        "₹472.31",
                        style: textTheme?.titleSmall?.copyWith(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0)
                        .copyWith(top: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Feeding India donation",
                              style:
                                  textTheme?.titleSmall?.copyWith(fontSize: 16),
                            ),
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: Checkbox(
                                value: true,
                                activeColor: primaryColorVariant,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (status) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Working towards a mainutrition-free India",
                              style: textTheme?.labelSmall?.copyWith(
                                color: grey.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              "₹1",
                              style: textTheme?.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/food_donation_banner.png",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
            headerItem("BEFORE YOU PLACE THE ORDER"),
            const TipWidget(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
              child: Material(
                color: white,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your details",
                                style: textTheme?.titleSmall,
                              ),
                              Text(
                                "Sekh Gulam Mainuddin, 1234567890",
                                style: textTheme?.labelSmall?.copyWith(
                                    color: grey.withOpacity(0.65), height: 1.6),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            headerItem("CANCELLATION POLICY"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15)
                  .copyWith(bottom: 50),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "100% cancellation fee will be applicable if you decide to cancel the order anytime after order placement. Avoid cancellation as it leads to food wastage",
                style: textTheme?.labelSmall?.copyWith(
                  color: grey.withOpacity(0.65),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColorVariant,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Add Address at next step",
                      style: textTheme?.labelSmall?.copyWith(
                        color: white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
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
    );
  }

  Widget headerItem(String title,
          {double topPadding = 30, double bottomPadding = 20}) =>
      Padding(
        padding: EdgeInsets.only(
            top: topPadding, bottom: bottomPadding, left: 20, right: 20),
        child: Text(
          title,
          style: textTheme?.bodyLarge?.copyWith(
            color: darkGrey.withOpacity(0.9),
            letterSpacing: 1.8,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget lineThroughText(String text, {double fontSize = 14}) => Text(
        text,
        style: textTheme?.bodyLarge?.copyWith(
          fontSize: fontSize,
          decoration: TextDecoration.lineThrough,
          decorationThickness: 2,
          decorationColor: grey.withOpacity(0.6),
          color: grey.withOpacity(0.6),
        ),
      );

  Widget freeText() => Text(
        " FREE",
        style: textTheme?.labelMedium?.copyWith(color: blueColor, fontSize: 14),
      );
}
