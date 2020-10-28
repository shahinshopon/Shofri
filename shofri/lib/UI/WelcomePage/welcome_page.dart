import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: AllColor.whitecolor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Image.asset("assets/home-wallpaper.png"),
                    Positioned(
                      top: SizeConfig.screenheight * 0.1,
                      left: SizeConfig.screenwidth* 0.1,
                      child: Column(
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              color: AllColor.whitecolor,
                              fontSize: SizeConfig.screenheight * 0.053,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "To",
                            style: TextStyle(
                              color: AllColor.whitecolor,
                              fontSize: SizeConfig.screenheight * 0.053,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Shofri",
                            style: TextStyle(
                              color: AllColor.whitecolor,
                              fontSize: SizeConfig.screenheight * 0.053,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      minWidth:SizeConfig.screenwidth* 0.5,
                      height: SizeConfig.screenheight  * 0.04,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.screenheight * 0.04
                        ),
                        side: BorderSide(color: AllColor.greycolor),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, "/register-seller"),
                      child: Text("Become a Seller"),
                    ),
                     SizedBox(height: SizeConfig.screenheight * 0.01),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Lets Shop !",
                          style: TextStyle(
                              color: AllColor.blackcolor,
                              fontSize: SizeConfig.screenheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                Navigator.of(context).pushNamed("/register"),
                          style: TextStyle(
                              color:AllColor.orangecolor,
                              fontSize: SizeConfig.screenheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dark Mode", style: TextStyle(color: AllColor.orangecolor)),
                        SizedBox(width: SizeConfig.screenwidth * 0.02),
                        Switch(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                     SizedBox(height: SizeConfig.screenheight * 0.01),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Already have an Account ?",
                          style: TextStyle(
                            color:AllColor.blackcolor,
                            fontSize: SizeConfig.screenheight * 0.018,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Navigator.of(context).pushNamed("/login"),
                          text: " Login",
                          style: TextStyle(
                            color: AllColor.orangecolor,
                            fontSize: SizeConfig.screenheight * 0.02,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: SizeConfig.screenheight * 0.02),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
