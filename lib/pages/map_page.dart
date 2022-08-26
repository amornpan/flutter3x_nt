import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/menu_drawer.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kNTRandD = CameraPosition(
    target: LatLng(14.02100653681219, 100.52788269999999),
    zoom: 16.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kNTRandD,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
