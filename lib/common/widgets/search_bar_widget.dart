import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';

class SearchBarWidget extends ConsumerWidget {
  final String? hint;
  final Color hintColor;
  final TextEditingController? controller;
  final Pair<IconData, VoidCallback> leading;
  final bool showTrailing;
  final VoidCallback onClick;
  final bool isChangingHint;
  final String? hintType;

  const SearchBarWidget({
    Key? key,
    this.hint,
    this.controller,
    this.hintColor = midLightGrey,
    required this.leading,
    required this.onClick,
    this.isChangingHint = false,
    this.hintType,
    this.showTrailing = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final hintStyle = textTheme.bodyLarge?.copyWith(
      color: hintColor,
      fontSize: 17,
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.fromBorderSide(
          BorderSide(color: lightGrey.withOpacity(0.8), width: 1),
        ),
      ),
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: leading.second,
            icon: Icon(
              leading.first,
              color: primaryColor,
            ),
          ),
          Expanded(
            child: controller == null
                ? GestureDetector(
                    onTap: onClick,
                    child: Text(
                      hint!,
                      style: hintStyle,
                    ),
                  )
                : TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: hintStyle,
                      border: InputBorder.none,
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                      color: black,
                      fontSize: 17,
                    ),
                    onTap: onClick,
                  ),
          ),
          Container(
            width: 1,
            height: 30,
            padding: const EdgeInsets.symmetric(vertical: 2),
            color: lightGrey,
          ),
          if (showTrailing)
            IconButton(
              onPressed: onClick,
              icon: const Icon(
                Icons.mic_none,
                color: primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
