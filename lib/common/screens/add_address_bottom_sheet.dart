import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/enums/order_for.dart';
import 'package:zomato_clone/common/widgets/address_type_widget.dart';
import 'package:zomato_clone/common/widgets/address_widget.dart';
import 'package:zomato_clone/common/widgets/bottom_sheet_close_button.dart';
import 'package:zomato_clone/common/widgets/custom_button.dart';
import 'package:zomato_clone/common/widgets/name_and_phone_number_widget.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  TextTheme? textTheme;
  var orderFor = OrderFor.myself;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final flatHouseFloorBuildingController = TextEditingController();
  final areaSectorLocalityController = TextEditingController();
  final nearbyLandmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetCloseButton(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    "Enter complete address",
                    style: textTheme?.labelLarge?.copyWith(fontSize: 20),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14)
                      .copyWith(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Who are you ordering for?",
                        style: textTheme?.labelSmall?.copyWith(
                          color: grey.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          orderForButtonWidget(
                            label: "Myself",
                            isSelected: orderFor == OrderFor.myself,
                            onClick: () {
                              if (orderFor != OrderFor.myself) {
                                setState(() {
                                  orderFor = OrderFor.myself;
                                });
                              }
                            },
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          orderForButtonWidget(
                            label: "Someone else",
                            isSelected: orderFor == OrderFor.someoneElse,
                            onClick: () {
                              if (orderFor != OrderFor.someoneElse) {
                                setState(() {
                                  orderFor = OrderFor.someoneElse;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      if (orderFor == OrderFor.someoneElse)
                        NameAndPhoneNumberWidget(
                          nameController: nameController,
                          phoneController: phoneController,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(
                          "Save address as *",
                          style: textTheme?.labelSmall?.copyWith(
                            color: grey.withOpacity(0.7),
                          ),
                        ),
                      ),
                      const AddressTypeWidget(),
                      AddressWidget(
                        flatHouseFloorBuildingController:
                            flatHouseFloorBuildingController,
                        areaSectorLocalityController:
                            areaSectorLocalityController,
                        nearbyLandmarkController: nearbyLandmarkController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                        child: CustomButton(
                          text: "Save Address",
                          borderRadius: 10,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget orderForButtonWidget({
    required String label,
    required bool isSelected,
    required VoidCallback onClick,
  }) =>
      GestureDetector(
        onTap: onClick,
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              color: primaryColorVariant,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                label,
                style: textTheme?.labelMedium?.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
}
