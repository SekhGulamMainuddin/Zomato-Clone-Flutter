import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/custom_dashed_divider.dart';

class AddMoreItemsAndCookingInstructionsWidget extends StatelessWidget {
  const AddMoreItemsAndCookingInstructionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            additionalItemButton(
              label: "Add more items",
              icon: Icons.add_circle_outline_rounded,
              textTheme: textTheme,
              onClick: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomDashedDivider(
                color: lightGrey.withOpacity(0.5),
                size: 20,
              ),
            ),
            additionalItemButton(
              label: "Add cooking instructions",
              icon: Icons.edit_note_rounded,
              textTheme: textTheme,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget additionalItemButton({
    required String label,
    required IconData icon,
    required TextTheme textTheme,
    required VoidCallback onClick,
  }) =>
      Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          splashColor: primarySwatch[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: darkGrey,
                  size: 18,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Text(
                      label,
                      style: textTheme.labelMedium?.copyWith(
                        color: darkGrey,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: darkGrey,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      );
}
