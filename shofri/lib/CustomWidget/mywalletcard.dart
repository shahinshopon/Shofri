import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';


class MyWalletCard extends StatelessWidget {
 MyWalletCard({ this.text,this.color }) ;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenwidth * 0.01),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.screenheight * 0.02))),
        child: Container(
          height: SizeConfig.screenheight * 0.13,
          width: SizeConfig.screenwidth,
          decoration: BoxDecoration(
              color: AllColor.whitecolor,
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.screenheight * 0.02))),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenwidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: SizeConfig.screenheight * 0.1,
                      width: SizeConfig.screenwidth * 0.32,
                      decoration: BoxDecoration(
                          color: AllColor.lightbluecolor,
                          borderRadius: BorderRadius.all(Radius.circular(
                              SizeConfig.screenheight * 0.02))),
                      child: Image.asset(
                        "assets/photo2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenwidth * 0.01,
                    ),

                    ///

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenheight * 0.01,
                        ),
                        Text(
                          "Black Cotton Top",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.024,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Order on 16 July,11:40",
                          style: TextStyle(
                            fontSize: SizeConfig.screenheight * 0.012,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenheight * 0.02,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: SizeConfig.screenheight * 0.02,
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "\$30.00",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.02,
                              color: color),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
