import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ChatPage/chatpagetab.dart';
import 'package:shofri/UI/ChatPage/radiuspage.dart';

class BuildBuyerChat extends StatefulWidget {
  @override
  _BuildBuyerChatState createState() => _BuildBuyerChatState();
}

class _BuildBuyerChatState extends State<BuildBuyerChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenheight*0.01,),
        ChatpageBuyingChat(
          circletext: "SS",
          circlecolor: AllColor.greycolor,
         circletextcolor: Color(0xff9DE5FF),
         titletext: "Smiley's Store",
         subtitle1text:"Lorem ipsum dolor sit amet," ,
         subtitle2text:"consectetur adipiscing elit, sed" ,
         trailingtext:"9:20AM" ,


        ),
        
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.screenwidth*0.25,
            right: SizeConfig.screenwidth*0.03
          ),
          child: Divider(
            thickness: 1,
            color: AllColor.black12color,
          ),
        ),
        ChatpageBuyingChat(
          circletext: "LB",
          circlecolor: Color(0xffBEBEFF),
         circletextcolor: AllColor.bluegreycolor,
         titletext: "LoveLee Bees",
         subtitle1text:"Laboris nisi ut aliquip ex ea" ,
         subtitle2text:"consectetur elit" ,
         trailingtext:"Yesterday" ,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.screenwidth*0.25,
            right: SizeConfig.screenwidth*0.03
          ),
          child: Divider(
            thickness: 1,
            color: AllColor.black12color,
          ),
        ),
        ChatpageBuyingChat(
          circletext: "SS",
          circlecolor: AllColor.greycolor,
         circletextcolor: Color(0xff9DE5FF),
         titletext: "Smiley's Store",
         subtitle1text:"Lorem ipsum dolor sit amet," ,
         subtitle2text:"consectetur adipiscing elit, sed" ,
         trailingtext:"9:20AM" ,


        ),
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.screenwidth*0.25,
            right: SizeConfig.screenwidth*0.03
          ),
          child: Divider(
            thickness: 1,
            color: AllColor.black12color,
          ),
        ),
        ChatpageBuyingChat(
          circletext: "SS",
          circlecolor: AllColor.greycolor,
         circletextcolor: Color(0xff9DE5FF),
         titletext: "Smiley's Store",
         subtitle1text:"Lorem ipsum dolor sit amet," ,
         subtitle2text:"consectetur adipiscing elit, sed" ,
         trailingtext:"9:20AM" ,


        ),
      
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RadiusPage()));
          },
                    child: Text(
            "Go to RadiusPage",
            style: TextStyle(color: Colors.orange),
          ),
        ),

        Expanded(
                  child: SizedBox(
            height: SizeConfig.screenheight*0.02,
          ),
        )
       
      ],
    ),
        
      ),
    );
  }
}


class ChatpageBuyingChat extends StatelessWidget {
   ChatpageBuyingChat({ this.circletext,this.titletext,this.subtitle1text,this.subtitle2text,this.trailingtext,this.circlecolor,this.circletextcolor }) ;
  final String circletext;
  final String titletext;
  final String subtitle1text;
  final String subtitle2text;
  final String trailingtext;
  final Color circletextcolor;
  final Color circlecolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: SizeConfig.screenwidth*0.05,
        right:SizeConfig.screenwidth*0.035,
       
      ),
      child: Container(
        height: SizeConfig.screenheight*0.12,
        width:SizeConfig.screenwidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.screenheight*0.05,
                  backgroundColor: circlecolor,
                  child: Center(child: Text(circletext,style:TextStyle(
                      fontSize: SizeConfig.screenheight*0.025,
                      color: circletextcolor
                    ))),
                ),
                SizedBox(width: SizeConfig.screenwidth*0.015,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titletext,style:TextStyle(
                      fontSize: SizeConfig.screenheight*0.02
                    )),
                    Text(subtitle1text,
                      
                      style:TextStyle(
                    fontSize: SizeConfig.screenheight*0.017,
                    
                      )),
                      Text(subtitle2text,
                      
                      style:TextStyle(
                    fontSize: SizeConfig.screenheight*0.017,
                    
                      )),

                       
                  ],
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(trailingtext,style:TextStyle(
                      fontSize: SizeConfig.screenheight*0.013,
                      
                    )),
                Icon(Icons.delete,size: SizeConfig.screenheight*0.032,)
              ],
            )
          ],
        ),
         ),
    );
  }
}
