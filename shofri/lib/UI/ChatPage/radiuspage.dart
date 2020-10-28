import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class RadiusPage extends StatefulWidget {
  @override
  _RadiusPageState createState() => _RadiusPageState();
}

class _RadiusPageState extends State<RadiusPage> {
  bool _value1 = false;
  bool _value2 = false;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AllColor.blackcolor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: SizeConfig.screenwidth * 0.02,
                ),
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.025,
                      color: AllColor.blackcolor),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth * 0.05,
                  right: SizeConfig.screenwidth * 0.02),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.screenheight * 0.01,
                  left: SizeConfig.screenwidth * 0.05,
                  right: SizeConfig.screenwidth * 0.03,
                  bottom: SizeConfig.screenheight * 0.007),
              child: TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenwidth * 0.08),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search by city,neighborhood or ZIP code",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  filled: true,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: AllColor.blackcolor,
            ),
            Expanded(
                child: SizedBox(
                height: SizeConfig.screenheight * 0.2,
              ),
            ),
            Divider(
              thickness: 1,
              color: AllColor.blackcolor,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth * 0.02,
                  right: SizeConfig.screenwidth * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Suggested Radius",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.03,
                              color: AllColor.blackcolor)),
                      Text("Show me listngs from this general area.",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.016,
                              color: AllColor.blackcolor)),
                    ],
                  ),
                  Checkbox(
                      value: _value1,
                      onChanged: (val1) {
                        setState(() {
                          _value1 = val1;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth * 0.02,
                  right: SizeConfig.screenwidth * 0.02),
              child: Divider(
                thickness: 2,
                color: Colors.black26,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth * 0.02,
                  right: SizeConfig.screenwidth * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Custom Radius",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.03,
                              color: AllColor.blackcolor)),
                      Text("Only show me listings with in a specific distance.",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.016,
                              color: AllColor.blackcolor)),
                    ],
                  ),
                  Checkbox(
                      value: _value2,
                      onChanged: (val2) {
                        setState(() {
                          _value2 = val2;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth * 0.02,
                  right: SizeConfig.screenwidth * 0.02),
              child: Divider(
                thickness: 2,
                color: Colors.black26,
              ),
            ),
            Container(
              height: SizeConfig.screenheight * 0.12,
              child: Padding(
                padding:  EdgeInsets.only(
                  right: SizeConfig.screenwidth*0.01
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 100,
                          divisions: 5,
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                      Text(_currentSliderValue.round().toString()),
                      Text("Km")
                    ],
                  ),
                ),
              ),
            ),
             Divider(
                thickness: 2,
                color: Colors.black26,
              ),
              Padding(
                padding:  EdgeInsets.all(
                  SizeConfig.screenheight*0.012
                ),
                child: Container(
                  height: SizeConfig.screenheight*0.045,
                  width: SizeConfig.screenwidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.screenwidth*0.03)
                    ),
                    color: Color(0xFF5B9DFF)
                  ),
                  child: Center(
                    child: Text("Apply",style: TextStyle(
                      fontSize: SizeConfig.screenheight*0.02,
                      fontWeight: FontWeight.bold,
                      color: AllColor.whitecolor
                    ),),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
