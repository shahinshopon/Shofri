import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/widget/search_location_shop.dart';

class ShopSettingsPage extends StatefulWidget {
  final Address location;

  const ShopSettingsPage({Key key, this.location}) : super(key: key);
  @override
  _ShopSettingsPageState createState() => _ShopSettingsPageState();
}

class _ShopSettingsPageState extends State<ShopSettingsPage> {
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  String _currentAddres = "";
  Address get location => widget.location;

  TimeOfDay _startTime = TimeOfDay(
    hour: 0,
    minute: 0,
  );

  TimeOfDay _finishTime = TimeOfDay(
    hour: 0,
    minute: 0,
  );

  TimeOfDay _breakStartTime = TimeOfDay(
    hour: 0,
    minute: 0,
  );

  TimeOfDay _breakFinishTime = TimeOfDay(
    hour: 0,
    minute: 0,
  );

  List<OpenTime> open = [];
  List<BreakTime> breakTime = [];

  _pickTime(TimeOfDay time) async {
    TimeOfDay picked =
        await showTimePicker(context: context, initialTime: time);
    if (picked != null) {
      return picked;
    }
  }

  @override
  void initState() {
    days.forEach((element) {
      open.add(OpenTime(start: _startTime, finish: _finishTime));
    });
    days.forEach((element) {
      breakTime
          .add(BreakTime(start: _breakStartTime, finish: _breakFinishTime));
    });
    if (location != null) {
      _currentAddres = location.addressLine;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:SizeConfig.screenheight * 0.4,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Image.asset(
                        "assets/shop-settings-wallpaper.png",
                      ),
                      Positioned(
                        bottom: SizeConfig.screenheight*0.075,
                        right: SizeConfig.screenwidth*0.025,
                        child: Icon(
                          Icons.add_a_photo,
                          color: AllColor.whitecolor,
                          size: 32,
                        ),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: SizeConfig.screenheight*0.007,
                            left:SizeConfig.screenwidth*0.025,
                            child: CircleAvatar(
                              radius: SizeConfig.screenheight*0.063,
                              backgroundColor:AllColor.orangecolor.shade300,
                            ),
                          ),
                          Positioned(
                            bottom: SizeConfig.screenheight*0.008,
                            left: SizeConfig.screenwidth*0.18,
                            child: Icon(Icons.edit),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                 SizedBox(height:SizeConfig.screenheight*0.042),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set Profile Info",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: AllColor.greycolor.shade600),
                      ),
                      SizedBox(height: SizeConfig.screenheight*0.042),
                      Text(
                        "Shop Name",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Shop Name",
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenheight*0.042),
                      Text(
                        "Shop Phone",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Phone Number",
                        ),
                      ),
                       SizedBox(height: SizeConfig.screenheight*0.042),
                      Text(
                        "Bank Account",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Bank Account",
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenheight*0.042),
                      Text(
                        "UPI ID",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "UPI ID",
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenheight*0.042),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.04),
                  child: Text(
                    "Shop Timing",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .apply(color:AllColor.greycolor.shade600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.screenheight*0.01),
                      Column(
                        children: days.map((e) {
                          int index = days.indexOf(e);
                          return ListTile(
                            leading: Icon(
                              Icons.timelapse,
                              color: AllColor.orangecolor,
                            ),
                            title: Text(e),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final result = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return dialogTimePicker(open[index]);
                                        });
                                    if (result != null && result is OpenTime) {
                                      setState(() {
                                        open.add(result);
                                      });
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Open Time"),
                                      Text(
                                          "${open[index].start.format(context)} - ${open[index].finish.format(context)}",style: TextStyle(
                                            fontSize: SizeConfig.screenheight*0.017
                                          ),)
                                    ],
                                  ),
                                ),
                                 SizedBox(
                                  width: SizeConfig.screenwidth*0.03,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final result = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return dialogBreakTimePicker(
                                              breakTime[index]);
                                        });
                                    if (result != null && result is BreakTime) {
                                      setState(() {
                                        breakTime.add(result);
                                      });
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Break Time"),
                                      Text(
                                          "${breakTime[index].start.format(context)} - ${breakTime[index].finish.format(context)}",style: TextStyle(
                                            fontSize: SizeConfig.screenheight*0.017
                                          ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.042),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set Shop Address",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      ListTile(
                        onTap: () async {
                          await showMaterialModalBottomSheet(
                            context: context,
                            expand: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  SizeConfig.screenheight*0.02
                                ),
                                topRight: Radius.circular(SizeConfig.screenheight*0.02),
                              ),
                            ),
                            builder: (context, scrollController) =>
                                SearchLocationShop(),
                          );
                        },
                        title: Text("Select on Map"),
                        subtitle: location == null
                            ? Text("Search Location")
                            : Text("$_currentAddres"),
                        trailing: Icon(
                          Icons.location_on,
                          size: SizeConfig.screenheight*0.041,
                          color: AllColor.bluegreycolor,
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: AllColor.orangecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.04),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: SizeConfig.screenheight*0.025,
                          color: AllColor.whitecolor,
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

  Widget dialogTimePicker(OpenTime openTime) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Container(
              height: SizeConfig.screenheight * 0.25,
              padding: EdgeInsets.all(
                SizeConfig.screenheight*0.02
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pick Time",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    children: [
                      FlatButton(
                        onPressed: () async {
                          final result = await _pickTime(openTime.start);
                          if (result != null) {
                            setState(() {
                              openTime.start = result;
                            });
                          }
                        },
                        child: Text("${openTime.start.format(context)}"),
                      ),
                      Text("To"),
                      FlatButton(
                        onPressed: () async {
                          final result = await _pickTime(openTime.finish);
                          if (result != null) {
                            setState(() {
                              openTime.finish = result;
                            });
                          }
                        },
                        child: Text("${openTime.finish.format(context)}"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text(
                          "Cancel",
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      SizedBox(width: SizeConfig.screenwidth*0.02),
                      FlatButton(
                        child: Text(
                          "Finish",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: AllColor.greencolor,
                        onPressed: () => Navigator.of(context).pop(openTime),
                      ),
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

  Widget dialogBreakTimePicker(BreakTime breakTime) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Container(
              height: SizeConfig.screenheight * 0.25,
              padding: EdgeInsets.all(
                SizeConfig.screenheight*0.02
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pick Time",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    children: [
                      FlatButton(
                        onPressed: () async {
                          final result = await _pickTime(breakTime.start);
                          if (result != null) {
                            setState(() {
                              breakTime.start = result;
                            });
                          }
                        },
                        child: Text("${breakTime.start.format(context)}"),
                      ),
                      Text("To"),
                      FlatButton(
                        onPressed: () async {
                          final result = await _pickTime(breakTime.finish);
                          if (result != null) {
                            setState(() {
                              breakTime.finish = result;
                            });
                          }
                        },
                        child: Text("${breakTime.finish.format(context)}"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text(
                          "Cancel",
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                       SizedBox(width: SizeConfig.screenwidth*0.02),
                      FlatButton(
                        child: Text(
                          "Finish",
                          style: TextStyle(
                            color: AllColor.whitecolor,
                          ),
                        ),
                        color: AllColor.greencolor,
                        onPressed: () => Navigator.of(context).pop(breakTime),
                      ),
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
}

class OpenTime {
  TimeOfDay start;
  TimeOfDay finish;

  OpenTime({this.start, this.finish});
}

class BreakTime {
  TimeOfDay start;
  TimeOfDay finish;

  BreakTime({this.start, this.finish});
}
