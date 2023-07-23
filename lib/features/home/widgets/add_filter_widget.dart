import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class AddFilterWidget extends StatelessWidget {
  final String tag;
  final String? icon;
  final bool hasMultiOption;
  final VoidCallback onClick;

  const AddFilterWidget(
      {Key? key,
      required this.tag,
      this.icon,
      this.hasMultiOption = false,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: white,
          elevation: 3,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onClick,
            child: Container(
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Image.asset(
                        icon!,
                        color: black,
                        height: 15,
                        width: 15,
                      ),
                    ),
                  Text(
                    tag,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  if (hasMultiOption)
                    const Icon(
                      Icons.arrow_drop_down,
                      color: black,
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
