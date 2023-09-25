import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: darkBlack,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Choose delivery location",
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(

                children: [

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
