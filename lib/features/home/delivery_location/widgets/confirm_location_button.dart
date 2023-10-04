import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class ConfirmLocationButton extends StatefulWidget {
  const ConfirmLocationButton({Key? key}) : super(key: key);

  @override
  State<ConfirmLocationButton> createState() => _ConfirmLocationButtonState();
}

class _ConfirmLocationButtonState extends State<ConfirmLocationButton> {
  var confirmLocation = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if(confirmLocation){
      Future.delayed(
        const Duration(seconds: 3),
            () {
          Navigator.pop(context);
        },
      );
    }
    return ElevatedButton(
      onPressed: () {
        if(!confirmLocation){
          setState(() {
            confirmLocation = true;
          });
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColorVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        child: confirmLocation
            ? const SizedBox(
          height: 18,
              width: 18,
              child: CircularProgressIndicator(
                  color: white,strokeWidth: 2,
                ),
            )
            : Text(
                "Confirm Location",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  color: white,
                ),
              ),
      ),
    );
  }
}
