import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/models/pair.dart';
import 'package:zomato_clone/common/widgets/search_bar_widget.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
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
                FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(30, 40),
                    initialZoom: 9.2,
                  ),
                  nonRotatedChildren: [
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.zomato.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(30, 40),
                          width: 80,
                          height: 80,
                          builder: (context) => FlutterLogo(),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
