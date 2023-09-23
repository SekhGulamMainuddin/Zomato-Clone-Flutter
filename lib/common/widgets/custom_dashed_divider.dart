import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class CustomDashedDivider extends StatelessWidget {
  final Color color;
  final int size;

  const CustomDashedDivider({Key? key, this.color = midGrey, this.size = 10,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        1100 ~/ size,
            (index) =>
            Expanded(
              child: Container(
                color: index % 2 == 0 ? Colors.transparent : color,
                height: 2,
              ),
            ),
      ),
    );
  }
}
