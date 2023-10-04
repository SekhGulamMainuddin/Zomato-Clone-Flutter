import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/enums/address_type.dart';

class AddressTypeWidget extends StatefulWidget {
  const AddressTypeWidget({Key? key}) : super(key: key);

  @override
  State<AddressTypeWidget> createState() => _AddressTypeWidgetState();
}

class _AddressTypeWidgetState extends State<AddressTypeWidget> {
  TextTheme? textTheme;
  AddressType? addressType;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 34,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          addressTypeWidget(
            label: "Home",
            type: AddressType.home,
          ),
          addressTypeWidget(
            label: "Work",
            type: AddressType.work,
          ),
          addressTypeWidget(
            label: "Hotel",
            type: AddressType.hotel,
          ),
          addressTypeWidget(
            label: "Other",
            type: AddressType.other,
          ),
        ],
      ),
    );
  }

  Widget addressTypeWidget({
    required String label,
    required AddressType type,
  }) =>
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              addressType = type;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: addressType == type ? primaryColorVariant : midLightGrey,
              ),
              color: addressType == type ? primaryColorVariant.withOpacity(0.05) : null,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: textTheme?.labelSmall,
            ),
          ),
        ),
      );
}
