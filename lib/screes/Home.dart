import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
//map dinmyc

class _HomeState extends State<Home> {
  //creer controleur
  GoogleMapController mapController;
  //creer une position
  final LatLng _center = const LatLng(33.541545, -7.673084);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //liste de marqueur
  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId('home'),
          position: LatLng(33.541556, -7.673083),
          icon: BitmapDescriptor.fromAsset(
              "assets/images/hamza.PNG"), //defaultMarker, //fromAsset("assets/images/hafsa.PNG"),
          infoWindow: InfoWindow(title: 'Votre position actuelle'))
    ].toSet();
  }

  Set<Circle> _circles = Set.from([
    Circle(
        circleId: CircleId('Infection'),
        center: LatLng(33.541556, -7.673083),
        radius: 100,
        strokeColor: Colors.red,
        fillColor: Colors.greenAccent[100])
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps Contact COVID-19'),
        ),
        body: GoogleMap(
            markers: _createMarker(),
            circles: _circles,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            )));
  }
}
