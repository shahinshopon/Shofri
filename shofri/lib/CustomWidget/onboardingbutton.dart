import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';



  Widget OnBoardingButton(String text, Function press) {
    return GestureDetector(
      onTap: press,
          child: Container(
        height: SizeConfig.screenheight*0.07,
        width: SizeConfig.screenwidth*0.88,
        decoration: BoxDecoration(
          border: Border.all(
            color: AllColor.whitecolor.withOpacity(0.2)
          ),
          color:AllColor.greycolor.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(
            SizeConfig.screenheight*0.03
            
          ))
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize:SizeConfig.screenheight*0.03 ,color: AllColor.whitecolor),)),
      ),
    );
  }
