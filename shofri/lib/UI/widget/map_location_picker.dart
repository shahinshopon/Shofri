import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shofri/UI/Homepage/homepage.dart';

class MapLocationPicker extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapLocationPicker(
      {Key key, @required this.latitude, @required this.longitude})
      : super(key: key);
  @override
  MapLocationPickerState createState() => MapLocationPickerState();
}

class MapLocationPickerState extends State<MapLocationPicker> {
  GlobalKey<MapLocationPickerState> mapKey = GlobalKey();
  GoogleMapController controller;
  LatLng currentLocation;
  Address currentAddress;

  _firstLoad() async {
    final addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(widget.latitude, widget.longitude));
    if (addresses.isNotEmpty) {
      setState(() {
        currentAddress = addresses.first;
      });
    }
  }

  @override
  void initState() {
    _firstLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GoogleMap(
          key: mapKey,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            zoom: 15,
            tilt: 1.0,
            target: LatLng(widget.latitude, widget.longitude),
          ),
          onMapCreated: (controller) {
            this.controller = controller;
          },
          onCameraMove: (position) async {
            setState(() {
              currentLocation = position.target;
            });
            final addresses = await Geocoder.local.findAddressesFromCoordinates(
                Coordinates(
                    currentLocation.latitude, currentLocation.longitude));
            if (addresses.isNotEmpty) {
              setState(() {
                currentAddress = addresses.first;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Icon(
            Icons.place,
            size: 48,
            color: Colors.red,
          ),
        ),
        Positioned(
          bottom: 16,
          child: FlatButton.icon(
            color: Colors.red,
            textColor: Colors.white,
            icon: Icon(Icons.my_location),
            label: Text("Cofirm Location"),
            onPressed: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    location: currentAddress,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
