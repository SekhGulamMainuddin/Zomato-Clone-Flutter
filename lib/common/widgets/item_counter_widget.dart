import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class ItemCounterWidget extends StatefulWidget {
  final double height;
  final int currentCounter;
  final void Function(int) counter;
  final EdgeInsets? iconPadding;
  final Color? backgroundColor;

  const ItemCounterWidget({
    Key? key,
    required this.height,
    required this.counter,
    required this.currentCounter,
    this.iconPadding, this.backgroundColor,
  }) : super(key: key);

  @override
  State<ItemCounterWidget> createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  var totalNumberCount = 0;

  @override
  void initState() {
    super.initState();
    totalNumberCount = widget.currentCounter;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColorVariant,
        ),
        borderRadius: BorderRadius.circular(10),
        color: widget.backgroundColor,
      ),
      child: Row(
        children: [
          iconButton(
            onPressed: () {
              setState(() {
                totalNumberCount--;
                widget.counter(totalNumberCount);
              });
            },
            icon: Icons.horizontal_rule_rounded,
          ),
          Expanded(
            child: Text(
              "$totalNumberCount",
              style: textTheme.labelMedium?.copyWith(
                fontSize: 0.4 * widget.height,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          iconButton(
            onPressed: () {
              setState(() {
                totalNumberCount++;
                widget.counter(totalNumberCount);
              });
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }

  Widget iconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) =>
      IconButton(
        onPressed: onPressed,
        padding: widget.iconPadding ?? EdgeInsets.zero,
        constraints: widget.iconPadding != null ? const BoxConstraints() : null,
        icon: Icon(
          icon,
          color: primaryColorVariant,
          size: 0.45 * widget.height,
        ),
      );
}
