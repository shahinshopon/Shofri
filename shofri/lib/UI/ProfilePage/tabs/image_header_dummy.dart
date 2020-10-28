import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class ImageHeaderDummy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          "assets/summer-wallpaper.png",
          width: SizeConfig.screenwidth * 0.9,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical:SizeConfig.screenheight*0.02,
            horizontal: SizeConfig.screenwidth*0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "For all your",
                style: TextStyle(
                  color:AllColor.whitecolor,
                  fontSize: SizeConfig.screenheight*0.027,
                ),
              ),
              Text(
                "summer clothing",
                style: TextStyle(
                  color: AllColor.whitecolor,
                  fontSize: SizeConfig.screenheight*0.027,
                ),
              ),
              Text(
                "needs",
                style: TextStyle(
                  color:AllColor.whitecolor,
                  fontSize: SizeConfig.screenheight*0.027,
                ),
              ),
               SizedBox(height: SizeConfig.screenheight*0.02),
              InkWell(
                onTap: () {
                  print("Clicked");
                },
                splashColor: AllColor.orangecolor,
                highlightColor: AllColor.orangecolor,
                child: Container(
                  width: SizeConfig.screenwidth*0.39,
                  height: SizeConfig.screenheight*0.058,
                  decoration: BoxDecoration(
                    color: AllColor.whitecolor,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenheight*0.04
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SEE MORE",
                        style: TextStyle(
                          fontSize: SizeConfig.screenheight*0.022,
                          color:AllColor.greycolor,
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenwidth*0.02),
                      ClipOval(
                        child: Container(
                          width: SizeConfig.screenwidth*0.08,
                          height: SizeConfig.screenheight*0.04,
                          color: AllColor.orangecolor,
                          child: Icon(
                            Icons.navigate_next,
                            color:AllColor.whitecolor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
