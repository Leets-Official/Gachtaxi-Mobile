import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location(this.name, this.latitude, this.longitude);

  static final Location centerOfgachon = Location(
    "가천대 구글맵 시점",
    37.44852635280086,
    127.12855122490176,
  );

  LatLng get position => LatLng(latitude, longitude);
}
