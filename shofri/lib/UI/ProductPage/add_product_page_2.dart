import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/widget/search_location_product.dart';

class AddProductPage2 extends StatefulWidget {
  final Address location;

  const AddProductPage2({Key key, this.location}) : super(key: key);
  @override
  _AddProductPage2State createState() => _AddProductPage2State();
}

class _AddProductPage2State extends State<AddProductPage2> {
  String _currentAddres = "";
  Address get location => widget.location;
  String currency = "₹";
  String platform = "";
  bool customerChoices = true;
  String colour = "";
  String attributes = "";
  final TextEditingController _txtPdf = TextEditingController();
  final FocusNode _fnPdf = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          centerTitle: true,
          iconTheme: IconThemeData(color: AllColor.whitecolor),
        ),
        body: Container(
          margin:  EdgeInsets.all(SizeConfig.screenheight*0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pricing",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: AllColor.greycolor.shade400),
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Unit Price",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Unit Price",
                  ),
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Purchase Price",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Purchase Price",
                  ),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Tax",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [
                    Container(
                      width: SizeConfig.screenwidth * 0.7,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Tax",
                        ),
                      ),
                    ),
                     SizedBox(width: SizeConfig.screenwidth*0.06),
                    _currencyDropDown(),
                  ],
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Discount",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [
                    Container(
                      width: SizeConfig.screenwidth * 0.7,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Discount",
                        ),
                      ),
                    ),
                   SizedBox(width:SizeConfig.screenwidth*0.06),
                    _currencyDropDown(),
                  ],
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Quantity",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Quantity",
                  ),
                ),
                SizedBox(height: SizeConfig.screenheight*0.04),
                Text(
                  "Videos",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: AllColor.greycolor.shade400),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Videos From",
                  style: Theme.of(context).textTheme.headline6,
                ),
                _platformDropDown(),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Video Link",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Video Link",
                    suffixIcon: Icon(
                      Icons.link,
                      color: AllColor.orangecolor,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Custome Choices",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color:AllColor.greycolor.shade400),
                ),
                SwitchListTile(
                  title: Text(
                    "Colour",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  value: customerChoices,
                  onChanged: (value) {
                    setState(() {
                      customerChoices = value;
                    });
                  },
                ),
                _colourDropDown(),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Videos From",
                  style: Theme.of(context).textTheme.headline6,
                ),
                _attributesDropDown(),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "PDF Specification",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: AllColor.greycolor.shade400),
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Upload PDF",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  controller: _txtPdf,
                  focusNode: _fnPdf,
                  onTap: () async {
                    _fnPdf.unfocus();
                    File file = await FilePicker.getFile(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    final pdfFile = file.readAsBytesSync();
                    setState(() {
                      _txtPdf.text = "Shop.pdf";
                    });
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "PDF File",
                    suffixIcon: Icon(
                      Icons.link,
                      color: AllColor.orangecolor,
                    ),
                  ),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Seller Location",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: AllColor.greycolor.shade400),
                ),
                ListTile(
                  onTap: () async {
                    await showMaterialModalBottomSheet(
                      context: context,
                      expand: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SizeConfig.screenheight*0.02),
                          topRight: Radius.circular(SizeConfig.screenheight*0.02),
                        ),
                      ),
                      builder: (context, scrollController) =>
                          SearchLocationProduct(),
                    );
                  },
                  title: Text("Select on Map"),
                  subtitle: location == null
                      ? Text("Search Location")
                      : Text("$_currentAddres"),
                  trailing: Icon(
                    Icons.location_on,
                    size: SizeConfig.screenheight*0.04,
                    color: AllColor.bluegreycolor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: AllColor.orangecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.screenheight*0.04
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/product");
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: SizeConfig.screenheight*0.025,
                          color:AllColor.whitecolor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _attributesDropDown() {
    return DropdownButton<String>(
      hint: Text(
        "Choose Attributes",
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
      items: [
        DropdownMenuItem(
          value: "Shade 100",
          child: Text(
            "Shade 100",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "Shade 200",
          child: Text(
            "Shade 200",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "Shade 300",
          child: Text(
            "Shade 300",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          attributes = value;
        });
      },
    );
  }

  Widget _colourDropDown() {
    return DropdownButton<String>(
      hint: Text(
        "Colour Image",
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
      items: [
        DropdownMenuItem(
          value: "Orange",
          child: Text(
            "Orange",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "Red",
          child: Text(
            "Red",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "Blue",
          child: Text(
            "Blue",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          colour = value;
        });
      },
    );
  }

  Widget _platformDropDown() {
    return DropdownButton<String>(
      hint: Text(
        "Select Platform",
        style: TextStyle(
          color: Colors.orange,
        ),
      ),
      items: [
        DropdownMenuItem(
          value: "Youtube",
          child: Text(
            "Youtube",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "Twitch",
          child: Text(
            "Twitch",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "Other",
          child: Text(
            "Other",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          platform = value;
        });
      },
    );
  }

  Widget _currencyDropDown() {
    return DropdownButton<String>(
      value: currency,
      items: [
        DropdownMenuItem(
          value: "₹",
          child: Text(
            "₹",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "USD",
          child: Text(
            "USD",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        DropdownMenuItem(
          value: "IDR",
          child: Text(
            "IDR",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          currency = value;
        });
      },
    );
  }
}
