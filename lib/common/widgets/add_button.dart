import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class AddButton extends StatelessWidget {
  final VoidCallback? onClick;
  const AddButton({Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return OutlinedButton(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
          backgroundColor: white,
          padding: const EdgeInsets.all(4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(color: primaryColor)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "ADD",
            style: textTheme.labelLarge
                ?.copyWith(fontSize: 16, color: primaryColor),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.add,
              color: primaryColor,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
