import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';



class ManageProfileContainer extends StatelessWidget {
  ManageProfileContainer({ this.titletext,this.subtitletext,this.image  });
  final String image;
  final String titletext;
  final String subtitletext;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight*0.08,
      width: SizeConfig.screenwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
        height: SizeConfig.screenheight*0.06,
     width:  SizeConfig.screenheight*0.06,
     decoration: BoxDecoration(
       shape: BoxShape.circle
     ),
     child: ClipRRect(
       borderRadius: BorderRadius.all(
         Radius.circular(SizeConfig.screenheight*0.05)
       ),
       child: Image.asset(image,fit: BoxFit.fill)),
              ),

              SizedBox(width: SizeConfig.screenwidth*0.025,),
          Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text(titletext,style: TextStyle(
           fontSize: SizeConfig.screenheight*0.023,
           fontWeight: FontWeight.bold
         ),),
         Text(subtitletext,style: TextStyle(
           fontSize: SizeConfig.screenheight*0.015,
          
         ),),
       ],
     ),
            ],
          ),
          
    // SizedBox(width: SizeConfig.screenwidth*0.22,), 
     Container(
               height: SizeConfig.screenheight*0.025,
               width: SizeConfig.screenwidth*0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color:AllColor.black12color,
                  width:1),
              ),
               child: Center(
                 child: Text("Following",style:TextStyle(
                   fontSize: SizeConfig.screenheight*0.018,
                   fontWeight: FontWeight.bold
                  
                 )),
               ),
             ),
        ],
      ),
    );
  }
}