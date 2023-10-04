import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/widgets/address_form_field_widget.dart';

class AddressWidget extends StatelessWidget {
  final TextEditingController flatHouseFloorBuildingController;
  final TextEditingController areaSectorLocalityController;
  final TextEditingController nearbyLandmarkController;

  const AddressWidget({
    Key? key,
    required this.flatHouseFloorBuildingController,
    required this.areaSectorLocalityController,
    required this.nearbyLandmarkController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: AddressFormFieldWidget(
            controller: flatHouseFloorBuildingController,
            hint: "Flat / House no / Floor / Building *",
          ),
        ),
        AddressFormFieldWidget(
          controller: areaSectorLocalityController,
          hint: "Area / Sector / Locality *",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: AddressFormFieldWidget(
            controller: nearbyLandmarkController,
            hint: "Nearby landmark (optional)",
          ),
        ),
      ],
    );
  }
}
