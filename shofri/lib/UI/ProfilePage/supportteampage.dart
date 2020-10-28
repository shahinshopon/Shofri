import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class SupportteamPage extends StatefulWidget {
  @override
  _SupportteamPageState createState() => _SupportteamPageState();
}

class _SupportteamPageState extends State<SupportteamPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              child: Container(
                height: SizeConfig.screenheight * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AllColor.orangecolor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.screenheight*0.04)
                        )
                      ),
                          child: CircleAvatar(
                            backgroundColor: AllColor.whitecolor,
                        radius: SizeConfig.screenheight*0.04,
                        child: Image.asset("assets/icon.png",
                       width: SizeConfig.screenwidth*0.08,
                        fit: BoxFit.cover
                      ),
                    ),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Support Team",
                            style: TextStyle(
                                fontSize: SizeConfig.screenheight * 0.022,
                                fontWeight: FontWeight.bold)),
                        Text("Offline",
                            style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.017,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenheight * 0.03,
            ),
            Center(
                child: Text("Tuesday, 9:20 AM",
                    style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.015,
                      color: Colors.black54
                    ))),
                SizedBox(height: SizeConfig.screenheight*0.02,),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth*0.02
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.screenheight*0.025)
                      )
                    ),
                         child: Container(
                      height: SizeConfig.screenheight*0.12,
                      width: SizeConfig.screenwidth*0.75,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(
                            SizeConfig.screenwidth*0.025
                          ),
                          child: Text("Sorry for the inconvenience. We will get back to you shortly.",
                          maxLines: 2,
                          style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.019,
                     
                    )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
               child: SizedBox(
                height: SizeConfig.screenheight*0.1,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth * 0.03,
                  right: SizeConfig.screenwidth * 0.02,
                  bottom: SizeConfig.screenwidth * 0.02,
                  top: SizeConfig.screenwidth * 0.02,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                       child: Row(
                    children: [
                      Container(
                        height: SizeConfig.screenheight * 0.055,
                        width: SizeConfig.screenwidth * 0.11,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: AllColor.yellowcolor),
                        ),
                        child: Center(
                            child: Icon(Icons.camera_alt,
                                size: SizeConfig.screenheight * 0.03,
                                color: AllColor.yellowcolor)),
                      ),
                      SizedBox(
                        width: SizeConfig.screenwidth * 0.03,
                      ),
                      //

                      Expanded(
                        child: Container(
                          height: SizeConfig.screenheight * 0.06,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenwidth * 0.08),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Type your message",
                              suffixIcon: Icon(
                                Icons.send,
                                color: AllColor.yellowcolor,
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
