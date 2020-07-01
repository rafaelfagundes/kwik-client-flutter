import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kwik_client_flutter/screens/delivery_request/custom_icon_widget.dart';
import 'package:kwik_client_flutter/utils/theme_utils.dart';
import 'package:kwik_client_flutter/widgets/section_title_widget.dart';

import 'list_adresses_widget.dart';
import 'value_and_request_footer_widget.dart';

class DeliveryRequestScreen extends StatefulWidget {
  @override
  _DeliveryRequestScreenState createState() => _DeliveryRequestScreenState();
}

class _DeliveryRequestScreenState extends State<DeliveryRequestScreen> {
  List<StopAddress> stopAdresses = [];
  GoogleMapController mapController;
  double backgroundHeight = 233;
  bool showSummary = false;

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

  void toggleSummary() {
    setState(() {
      showSummary = !showSummary;
    });
  }

  void addAddress(int position) {
    if (stopAdresses.length > 2) {
      return;
    }

    var newStopAddress = StopAddress('Nova parada', 'stop');

    var newAddressList = stopAdresses;
    newAddressList.insert(position, newStopAddress);

    setState(() {
      stopAdresses = newAddressList;
      backgroundHeight = backgroundHeight + 65 + 29;
    });
  }

  void removeAddress(int position) {
    var newAddressList = stopAdresses;
    newAddressList.removeAt(position);

    setState(() {
      stopAdresses = newAddressList;
      backgroundHeight = backgroundHeight - 65 - 29;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
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
          if (showSummary)
            Positioned(
              top: MediaQuery.of(context).padding.top + 29,
              left: 12,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  SFSymbols.chevron_left,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
              ),
            ),
          if (!showSummary)
            ListAdressesWidget(
                paddingTop: paddingTop,
                backgroundHeight: backgroundHeight,
                width: width,
                stopAdresses: stopAdresses,
                addAddress: addAddress,
                removeAddress: removeAddress,
                toggleSummary: toggleSummary),
          if (showSummary) RequestSummary(toggleSummary: toggleSummary)
        ],
      ),
    );
  }
}

class RequestSummary extends StatelessWidget {
  final Function toggleSummary;

  const RequestSummary({
    Key key,
    @required this.toggleSummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var isDark = ThemeUtils.isDark(context);

    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.95),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        width: width,
        padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 16 + MediaQuery.of(context).padding.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SectionTitle('Rota'),
                GestureDetector(
                    onTap: toggleSummary, child: CustomIconWidget(name: 'edit'))
              ],
            ),
            SizedBox(height: 16),
            SummaryAddressLine(
              label: 'Rua Frederico Ozanan, 150 - Guarda-Mor',
              icon: 'start',
            ),
            RouteSeparator(),
            SummaryAddressLine(
              label: 'Rua Ayrton Senna, 1991 - Centro',
              icon: 'stop',
            ),
            RouteSeparator(),
            SummaryAddressLine(
              label: 'Rua Nelson Piquet, 1986 - Fábricas',
              icon: 'stop',
            ),
            RouteSeparator(),
            SummaryAddressLine(
              label: 'Av. Niki Lauda,  650 - Bonfim',
              icon: 'end',
            ),
            SizedBox(height: 32),
            GestureDetector(
              onTap: null,
              child: Container(
                child: Row(
                  children: <Widget>[
                    CustomIconWidget(name: 'request_notes'),
                    SizedBox(width: 5),
                    Text(
                      'Inserir instruções ao entregador',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: isDark ? Color(0xffEE6352) : Color(0xff007AFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            ValueAndRequestFooterWidget(
              label: 'Valor do Percurso',
              value: 14.9,
              onPressed: () {
                Navigator.pushNamed(context, '/delivery_request_success');
              },
              valueSize: 16,
            )
          ],
        ),
      ),
    );
  }
}

class RouteSeparator extends StatelessWidget {
  const RouteSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      width: 18,
      height: 16,
      child: Center(
        child: Container(
          width: 2,
          height: 5,
          color: isDark ? Color(0xff444444) : Color(0xffdddddd),
        ),
      ),
    );
  }
}

class SummaryAddressLine extends StatelessWidget {
  final String label;
  final String icon;

  const SummaryAddressLine({
    Key key,
    @required this.label,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomIconWidget(name: icon),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Lato',
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
