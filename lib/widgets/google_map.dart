import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap  extends StatelessWidget{
  final LatLng? center;
  final Set<Marker> markers;
  final Function? onMapCreated;
  final Function? currentLocationFunction;

  MyGoogleMap({
    Key? key,
    this.center,
    required this.markers,
    this.onMapCreated,
    this.currentLocationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            if (onMapCreated != null) {
              onMapCreated!(controller);
            }
          },
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: center!,
            zoom: 13.0,
          ),
          markers: markers,
        ),
        Positioned(
          bottom: 30,
          right: 10,
          child: FloatingActionButton(
            foregroundColor: Colors.grey[400],
            backgroundColor: Colors.white,
            onPressed: () {
              if (currentLocationFunction != null) {
                currentLocationFunction!();
              }
            },
            child: Icon(Icons.my_location),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
        ),
      ],
    );
  }
}