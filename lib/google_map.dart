import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _marker = {};
  void _onMapCreaated(GoogleMapController controller) {
    setState(() {
      _marker.add(
        Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(27.7172, 85.3240),
            infoWindow: InfoWindow(title: 'Ev1', snippet: 'Charge here')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map"),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreaated,
          markers: _marker,
          initialCameraPosition:
              CameraPosition(target: LatLng(27.7172, 85.3240), zoom: 15),
        ));
  }
}
