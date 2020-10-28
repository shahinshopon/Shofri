import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File _image;
  final picker = ImagePicker();
  final FocusNode _fnCategory = FocusNode();
  final FocusNode _fnSubCategory = FocusNode();
  final FocusNode _fnBrand = FocusNode();
  final TextEditingController _txtCategory = TextEditingController();
  final TextEditingController _txtSubCategory = TextEditingController();
  final TextEditingController _txtBrand = TextEditingController();
  final TextEditingController _txtSearchCategory = TextEditingController();
  final TextEditingController _txtSearchSubCategory = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _image == null ? () => getImage() : null,
                      child: Container(
                        width: SizeConfig.screenwidth*0.3,
                        height: SizeConfig.screenheight*0.15,
                        child: Card(
                          color: AllColor.rgbocolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.screenheight*0.02
                            ),
                          ),
                          child: Center(
                            child: _image == null
                                ? Icon(
                                    Icons.add_a_photo,
                                    color: AllColor.ambercolor[700],
                                    size: SizeConfig.screenheight*0.04,
                                  )
                                : Image.file(_image),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: SizeConfig.screenheight*0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Upload Photo"),
                  ],
                ),
                 SizedBox(height: SizeConfig.screenheight*0.01),
                Text(
                  "Item Info",
                  style: Theme.of(context).textTheme.headline5,
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Product Name",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Item Category",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  focusNode: _fnCategory,
                  controller: _txtCategory,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Select Item Category",
                    suffixIcon: Icon(Icons.expand_more),
                  ),
                  onTap: () async {
                    _fnCategory.unfocus();
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return _dialogSelectCategory("Select Category");
                      },
                    );
                    if (result != false && result != null) {
                      setState(() {
                        _txtCategory.text = result;
                      });
                    }
                  },
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Item Sub Category",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  focusNode: _fnSubCategory,
                  controller: _txtSubCategory,
                  onTap: () async {
                    _fnSubCategory.unfocus();
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return _dialogSelectCategory("Select Sub Category");
                      },
                    );
                    if (result != false && result != null) {
                      setState(() {
                        _txtSubCategory.text = result;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Select Item Sub Category",
                    suffixIcon: Icon(Icons.expand_more),
                  ),
                ),
               SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Product Brand",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  focusNode: _fnBrand,
                  controller: _txtBrand,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Select Brand",
                    suffixIcon: Icon(Icons.expand_more),
                  ),
                  onTap: () async {
                    _fnBrand.unfocus();
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return _dialogSelectBrand();
                      },
                    );
                    if (result != false && result != null) {
                      setState(() {
                        _txtBrand.text = result;
                      });
                    }
                  },
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.screenheight*0.02
                        ),
                      ),
                      color: AllColor.orangecolor,
                      onPressed: () =>
                          Navigator.pushNamed(context, "/add-product2"),
                      icon: Icon(
                        Icons.navigate_next,
                        color: AllColor.whitecolor,
                      ),
                      label: Text("Next"),
                      textColor: AllColor.whitecolor,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogSelectBrand() {
    String groupValue = "";
    return StatefulBuilder(
      builder: (ctx, setState) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.screenheight*0.02
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(
              SizeConfig.screenheight*0.02
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Select Brand",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .apply(color: AllColor.orangecolor),
                  ),
                  SizedBox(height: SizeConfig.screenheight*0.02),
                  Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor:AllColor.greencolor,
                            value: "Nike",
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value;
                              });
                            },
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          Text(
                            "Nike",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor:AllColor.greencolor,
                            value: "Outfitters",
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value;
                              });
                            },
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          Text(
                            "Outfitters",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor:AllColor.greencolor,
                            value: "Gulahmed",
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value;
                              });
                            },
                          ),
                          SizedBox(width: SizeConfig.screenwidth*0.02),
                          Text(
                            "Gulahmed",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                       SizedBox(height: SizeConfig.screenheight*0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlatButton(
                            color: AllColor.orangecolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.screenheight*0.02
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("Cancel"),
                            textColor: AllColor.whitecolor,
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.04),
                          FlatButton(
                            color: AllColor.rgbocolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.screenheight*0.02
                              ),
                            ),
                            onPressed: () {
                              _txtSearchCategory.clear();
                              Navigator.of(context).pop(groupValue);
                            },
                            child: Text("Confirm"),
                            textColor:AllColor.whitecolor,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dialogSelectCategory(String title) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.02),
      ),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.screenheight*0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(color:AllColor.orangecolor),
              ),
               SizedBox(height: SizeConfig.screenheight*0.02),
              Text("Target Category: category >"),
              SizedBox(height:SizeConfig.screenheight*0.01),
              TextFormField(
                controller: _txtSearchCategory,
                decoration: InputDecoration(
                  hintText: "Search Category",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
               SizedBox(height: SizeConfig.screenheight*0.01),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: Text(
                  "Footwear",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  _txtSearchCategory.clear();
                  Navigator.of(context).pop("Footwear");
                },
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: Text(
                  "Appareles",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  _txtSearchCategory.clear();
                  Navigator.of(context).pop("Appareles");
                },
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: Text(
                  "Women Clothing",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  _txtSearchCategory.clear();
                  Navigator.of(context).pop("Women Clothing");
                },
              ),
               SizedBox(height:SizeConfig.screenheight*0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlatButton(
                    color:AllColor.orangecolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.02),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("Cancel"),
                    textColor:AllColor.whitecolor,
                  ),
                   SizedBox(width: SizeConfig.screenheight*0.02),
                  FlatButton(
                    color: AllColor.rgbocolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.02),
                    ),
                    onPressed: () {
                      _txtSearchCategory.clear();
                      Navigator.of(context).pop(_txtSearchCategory.text);
                    },
                    child: Text("Confirm"),
                    textColor: AllColor.whitecolor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
