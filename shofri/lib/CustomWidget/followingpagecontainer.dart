import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';



class FollowingPageReuseableWidget extends StatelessWidget {
  const FollowingPageReuseableWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight*0.14,
      width: SizeConfig.screenwidth,
      child: FittedBox(
        child: Row(
          
          children: [
            Container(
                height: SizeConfig.screenheight*0.14,
                width: SizeConfig.screenwidth*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.screenheight*0.02)
                  )
                ),
                child:Image.asset("assets/following.png")
              ),
              
            Container(
             height: SizeConfig.screenheight*0.1,
             width: SizeConfig.screenwidth*0.7,
             child: Card(
               margin: EdgeInsets.all(0),
                    child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                 children: [
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("FASHION WORLD",style: TextStyle(
                     fontSize: SizeConfig.screenheight*0.022,
                     fontWeight: FontWeight.bold),),
                   Row(
                     children: [
                       Icon(Icons.star,color: AllColor.yellowcolor,size:SizeConfig.screenwidth*0.045,),
                       Icon(Icons.star,color: AllColor.yellowcolor,size:SizeConfig.screenwidth*0.045),
                       Icon(Icons.star,color: AllColor.yellowcolor,size:SizeConfig.screenwidth*0.045),
                       Icon(Icons.star,color: AllColor.yellowcolor,size:SizeConfig.screenwidth*0.045),
                       Icon(Icons.star,color: AllColor.yellowcolor,size:SizeConfig.screenwidth*0.045),
                     ],
                   )
                 ],
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     height: SizeConfig.screenheight*0.035,
                     width: SizeConfig.screenwidth*0.25,
                    decoration: BoxDecoration(
                      color:Color(0xffF8991D),
               borderRadius: BorderRadius.all(
                 Radius.circular(SizeConfig.screenheight*0.02)
               )
            ), 
            child: Center(child: Text("Unfollow",style: TextStyle(
              fontSize: SizeConfig.screenheight*0.02,
              fontWeight: FontWeight.bold,color: AllColor.whitecolor),)),
                   ),
                   Row(
                     children: [
                       Text("Visit store",style: TextStyle(
              fontSize: SizeConfig.screenheight*0.018,
              fontWeight: FontWeight.bold,color: AllColor.orangecolor)),
                       Icon(Icons.share,size:SizeConfig.screenheight*0.02,color:AllColor.orangecolor)
                     ],
                   )
                 ],
               )
                 ],
               ),
             ),
            )
          ],
        ),
      ),
    );
  }
}