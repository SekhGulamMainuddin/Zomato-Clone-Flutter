import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/home/restaurant_page/widgets/food_item_widget.dart';
import 'package:zomato_clone/features/home/restaurant_page/widgets/restaurant_menu_items_widget.dart';

class ExpandableMenuWidget extends StatefulWidget {
  const ExpandableMenuWidget({Key? key}) : super(key: key);

  @override
  State<ExpandableMenuWidget> createState() => _ExpandableMenuWidgetState();
}

class _ExpandableMenuWidgetState extends State<ExpandableMenuWidget> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: white,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            splashColor: Colors.grey,
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(4),
                        ),
                        color: primaryColor),
                    width: 6,
                    height: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      "Best in Biryani (7)",
                      style: textTheme.titleSmall?.copyWith(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    size: 32,
                    fill: 1,
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          ),
          if (expanded)
            const RestaurantMenuItemsWidget(),
        ],
      ),
    );
  }
}
