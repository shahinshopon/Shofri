import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ShopSettingPage/shop_settings_page.dart';
import 'package:shofri/UI/widget/map_location_picker_shop.dart';

class SearchLocationShop extends StatefulWidget {
  @override
  _SearchLocationShopState createState() => _SearchLocationShopState();
}

class _SearchLocationShopState extends State<SearchLocationShop> {
  final TextEditingController _txtLocation = TextEditingController();
  final FocusNode _fnLocation = FocusNode();
  List<Address> recentLocation = [];
  String googleApiKey;
  GoogleMapsPlaces _places;

  _getLastKnownLocation() async {
    Position lastLocation = await getLastKnownPosition();
    recentLocation = await Geocoder.local.findAddressesFromCoordinates(
      Coordinates(
        lastLocation.latitude,
        lastLocation.longitude,
      ),
    );
  }

  @override
  void initState() {
    _getLastKnownLocation();
    if (Platform.isAndroid) {
      googleApiKey = "AIzaSyBV8CAhs0t7YYYILGUgN5jy7rEbJdHRnQM";
    } else if (Platform.isIOS) {
      googleApiKey = "AIzaSyDF2b1HRoP1Bnu3HjoynhFcD67q_lGs7s4";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  "Search Location",
                  style: Theme.of(context).textTheme.headline6,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    size:SizeConfig.screenheight*0.04,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Divider(thickness: 1),
               SizedBox(height: SizeConfig.screenheight*0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:SizeConfig.screenwidth*0.04),
                child: TextFormField(
                  controller: _txtLocation,
                  focusNode: _fnLocation,
                  decoration: InputDecoration(
                    hintText: "Search for the location",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onTap: () async {
                    _places = new GoogleMapsPlaces(apiKey: googleApiKey);
                    Prediction prediction = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: googleApiKey,
                      mode: Mode.fullscreen, // Mode.overlay
                      language: "en",
                      components: [Component(Component.country, "in")],
                    );
                    PlacesDetailsResponse detail =
                        await _places.getDetailsByPlaceId(prediction?.placeId);
                    _fnLocation.unfocus();
                    if (detail != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MapLocationPickerShop(
                            latitude: detail.result.geometry.location.lat,
                            longitude: detail.result.geometry.location.lng,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              _buildCurrentLocation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.screenheight*0.02),
        ListTile(
          title: Text(
            "Use current location",
            style: TextStyle(color: Colors.orange),
          ),
          subtitle: Text("Enable location"),
          leading: Icon(
            Icons.my_location,
            color: AllColor.orangecolor,
            size: SizeConfig.screenheight*0.04,
          ),
          onTap: () async {
            Position position = await getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
            );
            final coordinates =
                new Coordinates(position.latitude, position.longitude);
            var currentLocation =
                await Geocoder.local.findAddressesFromCoordinates(coordinates);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ShopSettingsPage(
                  location: currentLocation.first,
                ),
              ),
            );
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: AllColor.greycolor.shade300,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenwidth*0.02,
            vertical: SizeConfig.screenheight*0.005,
          ),
          child: Text(
            "RECENT LOCATION",
            style: TextStyle(
              fontSize: SizeConfig.screenheight*0.015,
            ),
          ),
        ),
         SizedBox(height: SizeConfig.screenheight*0.01),
        ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(thickness: 1);
          },
          shrinkWrap: true,
          itemCount: recentLocation.length,
          itemBuilder: (context, index) {
            final dataLocation = recentLocation[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ShopSettingsPage(
                      location: dataLocation,
                    ),
                  ),
                );
              },
              title: Text("${dataLocation.addressLine}"),
              leading: Icon(
                Icons.location_on,
                size: SizeConfig.screenheight*0.04,
              ),
              trailing: Icon(
                Icons.navigate_next,
                size: SizeConfig.screenheight*0.04,
              ),
            );
          },
        )
      ],
    );
  }
}
