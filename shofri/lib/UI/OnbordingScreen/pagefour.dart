import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/AllString/allstring.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
          height: SizeConfig.screenheight,
          width: SizeConfig.screenwidth,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage("assets/chatwithseller.png",),
              fit: BoxFit.fill
               )
          ),
           child: Padding(
           padding: EdgeInsets.only(
                left: SizeConfig.screenheight * 0.015,
                right: SizeConfig.screenheight * 0.015),
            child: Column(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(flex: 2,
                 child: Container(
                  height: SizeConfig.screenheight*0.2,
                  width: SizeConfig.screenwidth*0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/dashed-circle.png",))
                  ),
                  child: Center(
                    child: Container(
                      height: SizeConfig.screenheight*0.2,
                      width: SizeConfig.screenwidth*0.2,
                      child: Center(
                        child: Image.asset("assets/shoplogo.png",fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                  
                )),
                
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                        child: Text(
                              AllString.shofri,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.screenheight * 0.06,
                                  color: AllColor.whitecolor),
                            ),
                      ),
                    )),
                Expanded(flex: 2, child: Container(
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AllString.chatwithseller,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: SizeConfig.screenheight * 0.04,
                                  color:  AllColor.whitecolor),
                            ),
                            SizedBox(height: SizeConfig.screenheight*0.03,),
                            Text(
                             AllString.chatwithsellerdescription,
                             textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.screenheight * 0.023,
                                  color:  AllColor.whitecolor),
                            ),
                          ],
                        ),
                )),
                Expanded(flex:1,child: Container()),
                Expanded(flex: 2, child: Container()),
                   Expanded(flex: 2, child: Container()),
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}

