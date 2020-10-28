import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/CustomWidget/supportticketcard.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';


class SupportTicket extends StatefulWidget {
  @override
  _SupportTicketState createState() => _SupportTicketState();
}

class _SupportTicketState extends State<SupportTicket> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: AllColor.orangecolor,)),
              backgroundColor: AllColor.whitecolor,
              centerTitle: true,
              title: Text("SUPPORT TICKET",style: TextStyle(
                fontSize: SizeConfig.screenheight*0.022,
                fontWeight: FontWeight.bold,
                color: AllColor.blackcolor
              ),),
            ),
        body: Padding(
          padding:  EdgeInsets.all(SizeConfig.screenwidth*0.01),
          child: Column(
            children: [
              SupportTicketCard(),
              SupportTicketCard(),
              SupportTicketCard(),
              SupportTicketCard(),
              SupportTicketCard(),
             Padding(
               padding: EdgeInsets.only(
                 top: SizeConfig.screenheight*0.14,
                 right:SizeConfig.screenheight*0.01),
               child: Align(
                 alignment: Alignment.bottomRight,
                    child: Container(
                   height: SizeConfig.screenheight*0.05,
                   width: SizeConfig.screenwidth*0.35,
                   decoration: BoxDecoration(
                     color: AllColor.orangecolor,
            borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.screenheight*0.03)
            )
          ),
          child: Center(
            child: Text("Create Ticket",style: TextStyle(
                  fontSize: SizeConfig.screenheight*0.02,color: AllColor.whitecolor
            ),),
          ),
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
