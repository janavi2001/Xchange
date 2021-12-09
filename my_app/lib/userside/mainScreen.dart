import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/qrcode/intermediate.dart';
import 'package:my_app/widget/navigationWidgetUser.dart';
import 'package:my_app/widget/navigationWidgetVendor.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.859843, 77.663324),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          onTap: () {},
          markerId: MarkerId('id-1'),
          position: LatLng(12.851066, 77.64669),
          infoWindow: InfoWindow(title: 'Kantamma Sweets', snippet: 'Ph no: 9898634527')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: NavigationDrawerWidgetUser(),
      appBar: AppBar(
        title: Text(
          "XChange",
          style: TextStyle(color: Colors.white),
        ),
        
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
          ),
          Positioned(
              top: 550,
              right: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => intermediate(),
                    ));
                  },
                  child: Text("Scanner"))),
        ],
      ),
    );
  }
}
