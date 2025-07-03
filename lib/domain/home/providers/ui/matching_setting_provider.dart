import 'package:gachtaxi_app/common/constants/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matching_setting_provider.g.dart';

@riverpod
class MatchingSettingNotifier extends _$MatchingSettingNotifier {
  @override
  MatchingSettingState build() {
    return MatchingSettingState(
      departure: Location.basicDeparture,
      destination: Location.basicDestination,
      selectedFriends: {},
      selectedTags: {},
    );
  }

  void toggleLocation() {
    state = state.copyWith(
      departure: state.destination,
      destination: state.departure,
    );
  }

  void toggleFriend(String name) {
    final updated = {...state.selectedFriends};
    updated.contains(name) ? updated.remove(name) : updated.add(name);
    state = state.copyWith(selectedFriends: updated);
  }

  void toggleTag(String tag) {
    final updated = {...state.selectedTags};
    updated.contains(tag) ? updated.remove(tag) : updated.add(tag);
    state = state.copyWith(selectedTags: updated);
  }

  void setDeparture(Location location) {
    state = state.copyWith(departure: location);
  }

  void setDestination(Location location) {
    state = state.copyWith(destination: location);
  }
}

class MatchingSettingState {
  final Location departure;
  final Location destination;
  final Set<String> selectedFriends;
  final Set<String> selectedTags;

  MatchingSettingState({
    required this.departure,
    required this.destination,
    required this.selectedFriends,
    required this.selectedTags,
  });

  MatchingSettingState copyWith({
    Location? departure,
    Location? destination,
    Set<String>? selectedFriends,
    Set<String>? selectedTags,
  }) {
    return MatchingSettingState(
      departure: departure ?? this.departure,
      destination: destination ?? this.destination,
      selectedFriends: selectedFriends ?? this.selectedFriends,
      selectedTags: selectedTags ?? this.selectedTags,
    );
  }

  Location get center {
    final centerLat = (departure.position.latitude + destination.position.latitude) / 2;
    final centerLng = (departure.position.longitude + destination.position.longitude) / 2;
    return Location('중앙값', centerLat, centerLng);
  }
}
