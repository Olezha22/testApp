import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_app/features/map/models/ip_info_model.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    super.key,
    required this.ipInfo,
  });

  final IpInfoModel ipInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(ipInfo.lat, ipInfo.lon),
            zoom: 15,
          ),
          markers: {
            Marker(
              markerId: const MarkerId("1"),
              icon: BitmapDescriptor.defaultMarker,
              position: LatLng(ipInfo.lat, ipInfo.lon),
            )
          },
        ),
      ),
    );
  }
}
