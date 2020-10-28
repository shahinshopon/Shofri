import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProductPage/add_product_page_2.dart';


class MapLocationPickerProduct extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapLocationPickerProduct(
      {Key key, @required this.latitude, @required this.longitude})
      : super(key: key);
  @override
  MapLocationPickerProductState createState() =>
      MapLocationPickerProductState();
}

class MapLocationPickerProductState extends State<MapLocationPickerProduct> {
  GlobalKey<MapLocationPickerProductState> mapKey = GlobalKey();
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
          padding: EdgeInsets.only(bottom: SizeConfig.screenheight*0.03),
          child: Icon(
            Icons.place,
            size: SizeConfig.screenheight*0.06,
            color: AllColor.redcolor,
          ),
        ),
        Positioned(
          bottom: SizeConfig.screenheight*0.02,
          child: FlatButton.icon(
            color: AllColor.redcolor,
            textColor:AllColor.whitecolor,
            icon: Icon(Icons.my_location),
            label: Text("Cofirm Location"),
            onPressed: () async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AddProductPage2(
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
