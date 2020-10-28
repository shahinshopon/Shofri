import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/CustomWidget/followingpagecontainer.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: AllColor.orangecolor,)),
          title: Text("Followings",style: TextStyle(color: AllColor.blackcolor),),
          backgroundColor: AllColor.whitecolor,
        ),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.screenheight*0.01),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
                      child: Column(
              children: [
                FollowingPageReuseableWidget(),               
                FollowingPageReuseableWidget(),
                FollowingPageReuseableWidget(),               
                FollowingPageReuseableWidget(),
                FollowingPageReuseableWidget(),               
                FollowingPageReuseableWidget(),
                FollowingPageReuseableWidget(),               
                FollowingPageReuseableWidget(),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

