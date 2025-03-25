import 'package:gachtaxi_app/common/constants/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_location_provider.g.dart';

@riverpod
class MapLocationNotifier extends _$MapLocationNotifier {
  @override
  LocationState build() {
    return LocationState(
      departure: Location.basicDeparture,
      destination: Location.basicDestination,
    );
  }

  void toggleLoaction() {
    state = state.copyWith(
      departure: state.destination,
      destination: state.departure,
    );
  }
}

class LocationState {
  final Location departure;
  final Location destination;

  LocationState({required this.departure, required this.destination});

  Location get center {
    double centerLat =
        (departure.position.latitude + destination.position.latitude) / 2;
    double centerLng =
        (departure.position.longitude + destination.position.longitude) / 2;
    return Location('구글맵 중앙값', centerLat, centerLng);
  }

  LocationState copyWith({Location? departure, Location? destination}) {
    return LocationState(
      departure: departure ?? this.departure,
      destination: destination ?? this.destination,
    );
  }
}
