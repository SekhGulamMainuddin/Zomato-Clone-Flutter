import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';

class FilterListWidget extends StatefulWidget {
  const FilterListWidget({Key? key}) : super(key: key);

  @override
  State<FilterListWidget> createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  var selectedFilterIndex = -1;
  TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
              index: 0,
              color: greenColor,
            ),
            filterWidget(
              label: "Egg",
              imageIcon: "assets/images/egg_icon.png",
              index: 1,
              color: yellowColor,
            ),
            filterWidget(
              label: "Non-Veg",
              iconWidget: const VegOrNonVegIconWidget(
                isVeg: false,
              ),
              index: 2,
              color: deepChestnut,
            ),
            filterWidget(
              label: "Bestseller",
              imageIcon: "assets/images/best_seller_icon.png",
              index: 3,
              color: Colors.amberAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget filterWidget(
          {required String label,
          String? imageIcon,
          Widget? iconWidget,
          required int index,
          required Color color}) =>
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            color: white,
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                setState(() {
                  selectedFilterIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8).copyWith(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color:
                          selectedFilterIndex == index ? color : borderColor),
                ),
                child: Row(
                  children: [
                    iconWidget ??
                        Image.asset(
                          imageIcon!,
                          height: 18,
                          width: 18,
                        ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      label,
                      style: textTheme?.labelSmall,
                    ),
                    if (selectedFilterIndex == index)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilterIndex = -1;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.close,
                            color: black,
                            size: 18,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
