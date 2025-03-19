import 'package:gachtaxi_app/common/constants/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_location_provider.g.dart';

@riverpod
class MapLocationNotifier extends _$MapLocationNotifier {
  @override
  LocationState build() {
    return LocationState(
      departure: Location.basicDeparture,
      center: Location.centerOfgachon,
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
  final Location center;
  final Location destination;

  LocationState(
      {required this.departure,
      required this.destination,
      required this.center});

  LocationState copyWith(
      {Location? departure, Location? center, Location? destination}) {
    return LocationState(
      departure: departure ?? this.departure,
      center: center ?? this.center,
      destination: destination ?? this.destination,
    );
  }
}
