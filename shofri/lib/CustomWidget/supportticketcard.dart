import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';




class SupportTicketCard extends StatelessWidget {
  const SupportTicketCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 2,
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.screenheight*0.015)
            )
    ),
      child: Container(
        height: SizeConfig.screenheight*0.12,
          width: SizeConfig.screenwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.screenheight*0.015)
            )
          ),
               child: Padding(
                 padding: EdgeInsets.only(
                   left: SizeConfig.screenwidth*0.01,
                   top: SizeConfig.screenheight*0.01
                 ),
                 child: Row(
                   children: [
                     Container(
                         height: SizeConfig.screenheight*0.095,
                         width:  SizeConfig.screenheight*0.095,
                         decoration: BoxDecoration(
                           boxShadow:[
                             BoxShadow(
        color: Colors.black26,
        spreadRadius: 1,
        blurRadius: 1,
        offset: Offset(4,4), // changes position of shadow
      ),

       BoxShadow(
        color: Colors.white,
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(4,4), // changes position of shadow
      ),
                           ],
                      shape: BoxShape.circle,
                      color: Colors.white
                         ),
                         
                       ),
                     
                   SizedBox(width: SizeConfig.screenwidth*0.015,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("John Jackson",style: TextStyle(
                               fontSize: SizeConfig.screenheight*0.025,
                               fontWeight: FontWeight.bold
                             ),),
                             Text("Ticket ID#1000001336",style: TextStyle(
                               fontSize: SizeConfig.screenheight*0.012,
                              
                             ),),
                           ],
                         ),
                        SizedBox(width: SizeConfig.screenwidth*0.2,),        

                     Padding(
                       padding:EdgeInsets.only(
                         left: SizeConfig.screenwidth*0.05
                       ),
                       child: Align(
                         alignment: Alignment.topRight,
                                    child: Container(
                                   height: SizeConfig.screenheight*0.022,
                                   width: SizeConfig.screenwidth*0.12,
                                   decoration: BoxDecoration(
                                     color: AllColor.redacentcolor,
                             borderRadius: BorderRadius.all(
                               Radius.circular(SizeConfig.screenheight*0.02)
                             )
                           ),
                                   child: Center(
                                     child: Text("Pending",style:TextStyle(
                                       fontSize: SizeConfig.screenheight*0.012,
                                       color: AllColor.whitecolor
                                     )),
                                   ),
                                 ),
                       ),
                     ),
                   ],
                 ),
               ),
      ),
    );
  }
}