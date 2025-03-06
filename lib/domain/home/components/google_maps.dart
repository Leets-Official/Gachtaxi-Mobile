import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? _controller;

  static final CameraPosition _gachonCenter = CameraPosition(
    target: Location.centerOfgachon.position,
    zoom: 16.7,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: _gachonCenter,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
}
