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

  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    _loadCustomMarkers();
    _loadMapStyle();
  }

  Future<void> _loadCustomMarkers() async {
    final departureIconFuture = BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(50, 50)),
      'assets/icons/departure_marker.png',
    );

    final destinationIconFuture = BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(50, 50)),
      'assets/icons/destination_marker.png',
    );

    final results =
        await Future.wait([departureIconFuture, destinationIconFuture]);

    setState(() {
      _departureIcon = results[0];
      _destinationIcon = results[1];
    });
  }

  Future<void> _loadMapStyle() async {
    try {
      _mapStyle = await DefaultAssetBundle.of(context)
          .loadString('assets/images/google_map_style_dark.json');
      setState(() {});
    } catch (e) {
      debugPrint('맵 스타일 로딩 실패: $e');
    }
  }

  Future<void> _adjustCenterForBottomSheet() async {
    if (_controller == null) return;

    final screenHeight = MediaQuery.of(context).size.height;
    final bottomSheetHeight = 330.0;
    final center = ref.read(mapLocationNotifierProvider).center.position;

    double zoom = await _controller!.getZoomLevel();
    double bottomSheetRatio = bottomSheetHeight / screenHeight;
    // 줌 레벨이 클수록 위로 올라가도록 구현
    double latitudeOffset = bottomSheetRatio * (1 / (zoom * 10));
    LatLng adjustedCenter =
        LatLng(center.latitude - latitudeOffset, center.longitude);

    _controller!.animateCamera(CameraUpdate.newLatLng(adjustedCenter));
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(mapLocationNotifierProvider);
    final center = location.center.position;
    final departure = location.departure.position;
    final destination = location.destination.position;

    if (_departureIcon == null || _destinationIcon == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return GoogleMap(
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      style: _mapStyle,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 15.8,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _adjustCenterForBottomSheet();
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
