import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';

class DeliveryRequestScreen extends StatefulWidget {
  @override
  _DeliveryRequestScreenState createState() => _DeliveryRequestScreenState();
}

class _DeliveryRequestScreenState extends State<DeliveryRequestScreen> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-21.13952, -44.262752);

  void _onMapCreated(GoogleMapController controller, BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    if (isDark) {
      rootBundle.loadString('assets/maps/dark_map.json').then((config) {
        controller.setMapStyle(config);
      });
    } else {
      rootBundle.loadString('assets/maps/light_map.json').then((config) {
        controller.setMapStyle(config);
      });
    }
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            compassEnabled: true,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            onMapCreated: (controller) => _onMapCreated(controller, context),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
