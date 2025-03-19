import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gachtaxi_app/domain/home/providers/ui/map_location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends ConsumerStatefulWidget {
  const GoogleMaps({super.key});

  @override
  ConsumerState<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends ConsumerState<GoogleMaps> {
  GoogleMapController? _controller;

  BitmapDescriptor? _departureIcon;
  BitmapDescriptor? _destinationIcon;

  @override
  void initState() {
    super.initState();
    _loadCustomMarkers();
  }

  Future<void> _loadCustomMarkers() async {
    final departureIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(40, 40)),
      'assets/icons/departure_marker.png',
    );

    final destinationIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(40, 40)),
      'assets/icons/destination_marker.png',
    );

    setState(() {
      _departureIcon = departureIcon;
      _destinationIcon = destinationIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng center = ref.watch(mapLocationNotifierProvider).center.position;
    LatLng departure =
        ref.watch(mapLocationNotifierProvider).departure.position;
    LatLng destination =
        ref.watch(mapLocationNotifierProvider).destination.position;

    if (_departureIcon == null || _destinationIcon == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 15.5,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
      markers: {
        Marker(
          markerId: const MarkerId('departure'),
          position: departure,
          icon: _departureIcon!,
          infoWindow: const InfoWindow(title: "출발지"),
        ),
        Marker(
          markerId: const MarkerId('destination'),
          position: destination,
          icon: _destinationIcon!,
          infoWindow: const InfoWindow(title: "목적지"),
        )
      },
    );
  }
}
