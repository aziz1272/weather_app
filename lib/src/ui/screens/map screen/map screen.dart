import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/src/repository/models/weather_model.dart';
import '../../widgets/color_widgets.dart';

class MapScreen extends StatefulWidget {
  WeatherModel model;

  MapScreen({required this.model, super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorWidgets.purple_shade400,
        title: Text(
          widget.model.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          bearing: 192.8334901395799,
          tilt: 59.440717697143555,
          target: LatLng(widget.model.lat, widget.model.lon),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('position'),
            position: LatLng(widget.model.lat, widget.model.lon),
            infoWindow: const InfoWindow(title: 'Lokatsiya'),
          ),
        },
      ),
    );
  }
}
