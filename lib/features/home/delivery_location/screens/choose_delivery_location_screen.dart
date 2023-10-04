import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/home/delivery_location/widgets/map_widget.dart';

class ChooseDeliveryLocationScreen extends StatefulWidget {
  static const routeName = "/choose-delivery-location-screen";

  const ChooseDeliveryLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseDeliveryLocationScreen> createState() =>
      _ChooseDeliveryLocationScreenState();
}

class _ChooseDeliveryLocationScreenState
    extends State<ChooseDeliveryLocationScreen> {


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: darkBlack,
          ),
        ),
        title: Text(
          "Choose delivery location",
          style: textTheme.labelMedium?.copyWith(
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: const MapWidget(),
    );
  }
}
