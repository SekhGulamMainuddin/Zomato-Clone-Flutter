import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/item_counter_widget.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';

class AddedItemsWidget extends StatefulWidget {
  final String foodName;
  final String? foodDesc;
  final double price;
  final bool isEditable;
  final int itemCount;
  final bool isFree;

  const AddedItemsWidget({
    Key? key,
    required this.foodName,
    this.foodDesc,
    required this.price,
    this.isEditable = false,
    required this.itemCount,
    this.isFree = false,
  }) : super(key: key);

  @override
  State<AddedItemsWidget> createState() => _AddedItemsWidgetState();
}

class _AddedItemsWidgetState extends State<AddedItemsWidget> {
  TextTheme? textTheme;
  var currentCount = 1;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Container(
      color: white,
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VegOrNonVegIconWidget(
            size: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodName,
                    style: textTheme?.labelLarge
                        ?.copyWith(fontSize: 16, height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 2),
                    child: Text(
                      "₹${widget.price.toStringAsFixed(2)}",
                      style: textTheme?.labelSmall,
                    ),
                  ),
                  if (widget.foodDesc != null)
                    Text(
                      widget.foodDesc!,
                      style: textTheme?.labelSmall
                          ?.copyWith(color: midGrey, fontSize: 14),
                    ),
                  if (widget.isEditable)
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Edit",
                              style: textTheme?.bodyLarge?.copyWith(
                                  color: primaryColorVariant, fontSize: 14),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: primaryColorVariant,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 35,
                width: 92,
                child: ItemCounterWidget(
                  height: 35,
                  backgroundColor: primaryColorVariant.withOpacity(0.05),
                  iconPadding: const EdgeInsets.all(4),
                  counter: (count) {
                    setState(() {
                      currentCount = count;
                    });
                  },
                  currentCounter: currentCount,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 2),
                    child: Text(
                      "₹${widget.price.toStringAsFixed(2)}",
                      style: widget.isFree
                          ? textTheme?.labelSmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                              decorationColor: grey.withOpacity(0.9),
                              color: grey.withOpacity(0.9),
                            )
                          : textTheme?.labelSmall,
                    ),
                  ),
                  if (widget.isFree)
                    Text(
                      " FREE",
                      style: textTheme?.labelMedium
                          ?.copyWith(color: blueColor, fontSize: 16),
                    ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
