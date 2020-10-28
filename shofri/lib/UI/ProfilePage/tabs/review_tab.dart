

import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/addreview.dart';

class ReviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenheight*0.015),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 6,
              child: Container(
                padding: EdgeInsets.all(SizeConfig.screenheight*0.02),
                width: SizeConfig.screenwidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seller Summary",
                      style: Theme.of(context).textTheme.headline6.apply(
                            color: AllColor.greycolor.shade400,
                          ),
                    ),
                    SizedBox(height: SizeConfig.screenheight*0.01),
                    Text("Position Feedback(Past 6 months):75%"),
                    Text("Shofri sellers since: 27, April,2020"),
                     SizedBox(height: SizeConfig.screenheight*0.01),
                  ],
                ),
              ),
            ),
           SizedBox(height: SizeConfig.screenheight*0.02),
            Card(
              elevation: 6,
              child: Container(
                padding: EdgeInsets.all(SizeConfig.screenheight*0.02),
                width: SizeConfig.screenwidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail sellers rating",
                      style: Theme.of(context).textTheme.headline6.apply(
                            color:AllColor.greycolor.shade400,
                          ),
                    ),
                    SizedBox(height: SizeConfig.screenheight*0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Item as"),
                        Row(
                          children: [
                            Text("Described: "),
                            SizedBox(
                                width: SizeConfig.screenwidth * 0.2),
                            buildStar(),
                            SizedBox(width: SizeConfig.screenwidth*0.02),
                            buildRating(context),
                          ],
                        ),
                      ],
                    ),
                     SizedBox(height: SizeConfig.screenheight*0.01),
                    Row(
                      children: [
                        Text("Communication: "),
                        SizedBox(
                            width: SizeConfig.screenwidth * 0.105),
                        buildStar(),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        buildRating(context),
                      ],
                    ),
                     SizedBox(height: SizeConfig.screenheight*0.01),
                    Row(
                      children: [
                        Text("Shop Collection: "),
                        SizedBox(
                            width: SizeConfig.screenwidth * 0.106),
                        buildStar(),
                         SizedBox(width: SizeConfig.screenheight*0.01),
                        buildRating(context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenheight*0.04),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: SizeConfig.screenwidth*0.09,
                  backgroundColor: AllColor.bluegreycolor,
                  child: Text("SS"),
                ),
                SizedBox(width: SizeConfig.screenwidth*0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildStar(),
                        Text(
                          "7 Sep 2018",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .apply(color:AllColor.greycolor.shade400),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenheight*0.01),
                    Text("Sam Smith"),
                     SizedBox(height: SizeConfig.screenheight*0.01),
                    Container(
                      width:SizeConfig.screenwidth * 0.6,
                      child: Text(
                        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore",
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenheight*0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height: SizeConfig.screenheight*0.062,
                          child: Card(
                            color:AllColor.greencolor,
                          ),
                        ),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height: SizeConfig.screenheight*0.062,
                          child: Card(
                            color: AllColor.bluecolor,
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenwidth*0.02),
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height: SizeConfig.screenheight*0.062,
                          child: Card(
                            color: AllColor.yellowcolor,
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenwidth*0.02),
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height: SizeConfig.screenheight*0.062,
                          child: Card(
                            color:AllColor.redcolor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height:SizeConfig.screenheight*0.02),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius:SizeConfig.screenwidth*0.09,
                  backgroundColor: AllColor.bluegreycolor,
                  child: Text("SS"),
                ),
                 SizedBox(width:SizeConfig.screenwidth*0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildStar(),
                        Text(
                          "7 Sep 2018",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .apply(color: AllColor.greycolor.shade400),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenheight*0.01),
                    Text("Sam Smith"),
                     SizedBox(height: SizeConfig.screenheight*0.01),
                    Container(
                      width:SizeConfig.screenwidth* 0.6,
                      child: Text(
                        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore",
                      ),
                    ),
                     SizedBox(height: SizeConfig.screenheight*0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height:SizeConfig.screenheight*0.062,
                          child: Card(
                            color:AllColor.greencolor,
                          ),
                        ),
                         SizedBox(width:SizeConfig.screenwidth*0.02),
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height: SizeConfig.screenheight*0.062,
                          child: Card(
                            color:AllColor.bluecolor,
                          ),
                        ),
                        SizedBox(width:SizeConfig.screenwidth*0.02),
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height: SizeConfig.screenheight*0.062,
                          child: Card(
                            color:AllColor.yellowcolor,
                          ),
                        ),
                         SizedBox(width:SizeConfig.screenwidth*0.02),
                        Container(
                          width: SizeConfig.screenwidth*0.125,
                          height:SizeConfig.screenheight*0.062,
                          child: Card(
                            color: AllColor.redcolor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddReviewPage()));
                      },
                                          child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenwidth*0.075
                        ),
                        child: Center(
                          child: Container(
                            height: SizeConfig.screenheight*0.045,
                            width: SizeConfig.screenwidth*0.3,
                            decoration: BoxDecoration(
                              color: AllColor.orangecolor,
                               borderRadius: BorderRadius.all(
                             Radius.circular(SizeConfig.screenheight*0.02)
                                )
                            ),
                             child: Center(
                            child: Text("Add Review",
                            style: TextStyle(color: AllColor.whitecolor))
                            )
                           
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildRating(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "2.5",
        style: TextStyle(color: AllColor.redcolor),
      ),
       SizedBox(width: SizeConfig.screenwidth*0.01),
      Text(
        "(4 rating)",
        style: Theme.of(context).textTheme.caption,
      ),
    ],
  );
}

Widget buildStar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        color: AllColor.yellowcolor,
        size: SizeConfig.screenheight*0.02,
      ),
      Icon(
        Icons.star,
        color:AllColor.yellowcolor,
        size: SizeConfig.screenheight*0.02,
      ),
      Icon(
        Icons.star_half,
        color: AllColor.yellowcolor,
        size: SizeConfig.screenheight*0.02,
      ),
      Icon(
        Icons.star_border,
        color: AllColor.bluegreycolor,
        size: SizeConfig.screenheight*0.02,
      ),
      Icon(
        Icons.star_border,
        color: AllColor.bluegreycolor,
        size: SizeConfig.screenheight*0.02,
      ),
    ],
  );
}
