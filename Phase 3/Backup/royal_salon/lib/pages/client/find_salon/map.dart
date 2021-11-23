import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/main.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    final appBlock = Provider.of<ApplBlock>(context);
    return Scaffold(
      body: (appBlock.currentLocation == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(children: [
              const TextField(
                decoration: InputDecoration(hintText: 'Search Location'),
              ),
              Container(
                height: 400,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(appBlock.currentLocation.latitude,
                          appBlock.currentLocation.longitude),
                      zoom: 10),
                ),
              ),
            ]),
    );
  }
}
