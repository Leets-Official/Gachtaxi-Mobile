import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location(this.name, this.latitude, this.longitude);

  static final Location centerOfgachon = Location(
    "가천대 구글맵 시점",
    37.449694962471774,
    127.1310169248561,
  );

  static final Location basicDeparture = Location(
    '가천대 정문',
    37.45051487868865,
    127.12689330709496,
  );

  static final Location basicDestination = Location(
    '가천대 AI 공학관',
    37.45532672771233,
    127.13463780887568,
  );

  LatLng get position => LatLng(latitude, longitude);
}
