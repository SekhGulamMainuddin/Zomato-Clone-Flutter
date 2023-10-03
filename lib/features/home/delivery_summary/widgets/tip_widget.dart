import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class TipWidget extends StatefulWidget {
  const TipWidget({Key? key}) : super(key: key);

  @override
  State<TipWidget> createState() => _TipWidgetState();
}

class _TipWidgetState extends State<TipWidget> {
  TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14).copyWith(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tip your delivery partner",
                  style: textTheme?.titleSmall?.copyWith(fontSize: 16),
                ),
                Text(
                  "Your kindness means a lot! 100% of your tip will go directly to them",
                  style: textTheme?.labelSmall?.copyWith(
                    color: grey.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                tipAmountWidget(
                  amount: 20,
                  emoji: "😀",
                ),
                tipAmountWidget(
                  amount: 30,
                  emoji: "🤗",
                  isMostTipped: true,
                ),
                tipAmountWidget(
                  amount: 50,
                  emoji: "😍",
                ),
                tipAmountWidget(
                  amount: -1,
                  emoji: "👏",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tipAmountWidget({
    required int amount,
    required String emoji,
    bool isMostTipped = false,
  }) =>
      Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: lightGrey),
        ),
        margin: const EdgeInsets.only(right: 15),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "$emoji ${amount==-1?"Other":"₹$amount"}",
                        style: textTheme?.labelMedium?.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                if (isMostTipped)
                  ColoredBox(
                    color: primaryColorVariant,
                    child: SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "MOST TIPPED",
                          style: textTheme?.bodyLarge?.copyWith(
                            color: white,
                            fontSize: 10,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
