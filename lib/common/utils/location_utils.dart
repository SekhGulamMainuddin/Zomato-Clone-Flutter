import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zomato_clone/common/utils/utils.dart';

void checkPermissions(BuildContext context) {
  Geolocator.isLocationServiceEnabled().then(
    (status) {
      if (status) {
        checkLocationPermissions(context);
      } else {
        showSnackBar(context, "GPS is not enabled please enable it");
      }
    },
  );
}

void checkLocationPermissions(BuildContext context) {
  Geolocator.checkPermission().then(
    (permission) {
      if (permission == LocationPermission.denied) {
        requestLocationPermissions(context);
      } else {
        print("GPS Location permission granted.");
      }
    },
  );
}

void requestLocationPermissions(BuildContext context) {
  Geolocator.requestPermission().then(
    (permission) {
      if (permission == LocationPermission.denied) {
        requestLocationPermissions(context);
      } else if (permission == LocationPermission.deniedForever) {
        showSnackBar(context, "Location permissions are permanently denied");
      } else {
        showSnackBar(context, "Location service granted");
      }
    },
  );
}

Future<bool> checkAllLocationPermissions() async {
  try {
    final gpsPermission = await Geolocator.isLocationServiceEnabled();
    final locationPermission = await Geolocator.checkPermission();
    return gpsPermission &&
        locationPermission != LocationPermission.denied &&
        locationPermission != LocationPermission.deniedForever;
  } catch (e) {
    return false;
  }
}

Future<Position> getCurrentLocation() async {
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
