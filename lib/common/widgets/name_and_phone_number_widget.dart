import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/address_form_field_widget.dart';

class NameAndPhoneNumberWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const NameAndPhoneNumberWidget({
    Key? key,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: AddressFormFieldWidget(
                    controller: nameController,
                    hint: "Name",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: grey.withOpacity(0.8),
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/contacts_icon.png",
                        fit: BoxFit.contain,
                        color: grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        TextFormField(
          controller: phoneController,
          style: textTheme.bodyLarge?.copyWith(fontSize: 15, height: 1.5),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Phone Number";
            }
            return null;
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: "Phone Number",
            prefixIcon: SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  "+91",
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
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
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
