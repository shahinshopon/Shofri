import 'dart:ui';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ChatPage/buildbuyerchat.dart';
import 'package:shofri/UI/ChatPage/buildsellerchat.dart';


class ChatPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: DefaultTabController(
            length: 2,
             child: Scaffold(
               appBar: PreferredSize(
                 preferredSize: Size.fromHeight(SizeConfig.screenheight*0.06),
                    child: AppBar(
                   backgroundColor: AllColor.whitecolor,
                   automaticallyImplyLeading: false,
                   bottom: TabBar(
            
             // controller: _tabController,
              labelColor: AllColor.blackcolor,
              
              indicatorColor: AllColor.orangecolor,
              tabs: [
                  Tab(
                    text: "BUYING CHAT",
                  ),
                  Tab(
                    text: "SELLING CHAT",
                  ),
              ],
            ),
                 ),
               ),
       
        body: TabBarView(
           // controller: _tabController,
            children: [
               BuildBuyerChat(),
              BuildSellerChat(),
             
            ],
        ),
      ),
          ),
    );
  }
}


 
 // Widget _buildSellerChat(){}

  /*Widget _buildSellerChat() {
    return FittedBox(
          child: Center(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: SizeConfig.screenheight*0.035,
          width:SizeConfig.screenwidth*0.07,
          child: Image.asset("assets/sad.png",fit: BoxFit.fill,)),
        Text(
          "Please Login",
          style: Theme.of(context).textTheme.headline6,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RadiusPage()));
          },
                    child: Text(
            "Log in to chat with buyer",
            style: TextStyle(color: AllColor.orangecolor),
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pushNamed("/login"),
          child: Text("Login"),
        )
      ],
          ),
        ),
    );
  }*/

