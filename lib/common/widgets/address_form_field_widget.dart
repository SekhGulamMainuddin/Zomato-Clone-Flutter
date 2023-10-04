import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class AddressFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isOptional;

  const AddressFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.isOptional = false,
  }) : super(key: key);

  @override
  State<AddressFormFieldWidget> createState() => _AddressFormFieldWidgetState();
}

class _AddressFormFieldWidgetState extends State<AddressFormFieldWidget> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      focusNode.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: darkGrey, width: 1.5),
    );
    final normalBorder = enabledBorder.copyWith(
      borderSide: BorderSide(
        color: midLightGrey.withOpacity(0.5),
      ),
    );
    return TextFormField(
      controller: widget.controller,
      style: textTheme.bodyLarge?.copyWith(
        fontSize: 15
      ),
      focusNode: focusNode,
      validator: (value) {
        if((value==null || value.isEmpty) && !widget.isOptional){
          return widget.hint;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: widget.hint,
        labelStyle: textTheme.labelSmall?.copyWith(
          fontSize: 14,
          color: focusNode.hasFocus ? grey : midLightGrey,
        ),
        floatingLabelStyle: textTheme.labelSmall?.copyWith(
          fontSize: 16,
          color: focusNode.hasFocus ? grey : midLightGrey,
        ),
        border: normalBorder,
        focusedBorder: enabledBorder,
        disabledBorder: normalBorder,
        enabledBorder: normalBorder,
        isDense: true,
        isCollapsed: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      ),
    );
  }
}
