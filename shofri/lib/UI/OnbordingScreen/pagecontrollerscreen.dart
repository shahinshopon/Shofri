import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/CustomWidget/onboardingbutton.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/OnbordingScreen/pagefour.dart';
import 'package:shofri/UI/OnbordingScreen/pageone.dart';
import 'package:shofri/UI/OnbordingScreen/pagethree.dart';
import 'package:shofri/UI/OnbordingScreen/pagetwo.dart';
import 'package:shofri/UI/SignUp/registersellerpage.dart';
import 'package:shofri/UI/SignUp/signuppage.dart';

class PageControllerScreen extends StatefulWidget {
  @override
  _PageControllerScreenState createState() => _PageControllerScreenState();
}

class _PageControllerScreenState extends State<PageControllerScreen> {
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageIndicatorContainer(
                child: PageView(
                  controller: _controller,
                  children: [PageOne(), PageTwo(), PageThree(), PageFour()],
                ),
                indicatorSpace: 15.0,
                padding: EdgeInsets.only(bottom: SizeConfig.screenheight * 0.3),
                indicatorColor: AllColor.greycolor,
                indicatorSelectorColor: AllColor.whitecolor,
                shape: IndicatorShape.circle(size: 9),
                length: 4),
            Positioned(
                bottom: 0,
                child: Container(
                  height: SizeConfig.screenheight * 0.25,
                  width: SizeConfig.screenwidth,
                  color: AllColor.transparentcolor,
                  child: Column(
                    children: [
                      OnBoardingButton(
                        "Become a Seller",
                        () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>RegisterSellerPage()));
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.screenheight * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.screenheight * 0.03,
                            left: SizeConfig.screenheight * 0.03),
                        child: Container(
                          width: SizeConfig.screenwidth,
                          child: Row(children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: AllColor.whitecolor,
                            )),
                            Text(
                              "OR",
                              style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.02,
                                  color: AllColor.whitecolor),
                            ),
                            Expanded(
                                child: Divider(
                              color: AllColor.whitecolor,
                            )),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenheight * 0.03,
                      ),
                      OnBoardingButton("Let's Shop! SignUP", () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>RegisterPage()));
                      })
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
