import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/utils/location_utils.dart';
import 'package:zomato_clone/common/widgets/search_bar_widget.dart';
import 'package:zomato_clone/features/home/delivery_location/widgets/confirm_location_button.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final MapController mapController = MapController();
  final pointSize = 50.0;
  var pointY = 0.0;
  LatLng? latLng;
  Placemark? placemark;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updatePoint(null, context);
    });
  }

  _toggleItemAddedContainer() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    pointY = MediaQuery.sizeOf(context).height * 0.4;
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SearchBarWidget(
            leading: Pair(
              Icons.search_rounded,
              () {
                // Navigator.pushNamed(context, SearchScreen.routeName);
              },
            ),
            hint: "Search for area, street name...",
            onClick: () {},
            showTrailing: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              onMapEvent: (event) {
                updatePoint(null, context);
              },
              initialCenter: latLng ?? const LatLng(28.7041, 77.1025),
              initialZoom: 10,
              minZoom: 3,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 140,
                    height: 140,
                    point: latLng ?? const LatLng(28.7041, 77.1025),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        backgroundColor:
                            mapMarkerSurroundColor.withOpacity(0.6),
                        radius: 8,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: pointY - pointSize / 2,
          left: _getPointX(context) - pointSize / 2,
          child: Icon(
            Icons.location_on_rounded,
            color: primaryColorVariant,
            size: pointSize,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
            color: transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                    onPressed: fetchCurrentLocation,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: primaryColorVariant),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.my_location,
                          color: primaryColorVariant,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Use current location",
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: primaryColorVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      SizeTransition(
                        sizeFactor: _animation,
                        axis: Axis.vertical,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5)
                              .copyWith(bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: primaryColorVariant,
                                size: 32,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      placemark?.locality ?? "Unknown",
                                      style: textTheme.titleSmall
                                          ?.copyWith(fontSize: 20),
                                    ),
                                    Text(
                                      placemark?.country ?? "Unknown",
                                      style: textTheme.labelSmall?.copyWith(
                                        color: grey,
                                        fontSize: 13,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ConfirmLocationButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Timer timer = Timer(
    const Duration(milliseconds: 2500),
    () async {},
  );

  void updatePoint(MapEvent? event, BuildContext context) {
    final pointX = _getPointX(context);
    latLng = mapController.camera.pointToLatLng(Point(pointX, pointY));
    print("Lat: ${latLng?.latitude}, Long: ${latLng?.longitude}");
    timer.cancel();
    timer = Timer(
      const Duration(milliseconds: 2500),
      () async {
        areaFromLatLng();
      },
    );
    setState(() {});
  }

  void areaFromLatLng() async {
    placemark = (await placemarkFromCoordinates(
        latLng!.latitude, latLng!.longitude))[0];
    mapController.move(latLng!, 10);
    setState(() {});
  }

  double _getPointX(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  void fetchCurrentLocation() {
    _toggleItemAddedContainer();
    checkAllLocationPermissions().then(
      (permissionGranted) {
        if (permissionGranted) {
          getCurrentLocation().then(
            (position) {
              latLng = LatLng(
                position.latitude,
                position.longitude,
              );
              areaFromLatLng();
              _toggleItemAddedContainer();
            },
          );
        } else {
          checkPermissions(context);
        }
      },
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
