import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class BuildSellerChat extends StatefulWidget {
  @override
  _BuildSellerChatState createState() => _BuildSellerChatState();
}

class _BuildSellerChatState extends State<BuildSellerChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: ListView(
              shrinkWrap: true,
              children: [
                Column(
        children: [   
     Container(
       height: SizeConfig.screenheight*0.83,
            child: Column(
              children: [
                Container(
         height: SizeConfig.screenheight*0.08,
         child: Padding(
           padding:  EdgeInsets.all(SizeConfig.screenheight*0.01),
           child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
         Row(
           children: [
                 GestureDetector(
                       onTap: (){
                             // Navigator.pop(context);
                       },
                       child: Icon(Icons.arrow_back_ios,color: AllColor.orangecolor,)),
                 SizedBox(width: SizeConfig.screenwidth*0.01,),
                 CircleAvatar(
                       radius: SizeConfig.screenheight*0.036,
                       backgroundColor: Color(0xffB7E6E6),
                       child: Text("S",style: TextStyle(
                              fontSize: SizeConfig.screenheight*0.025,
                              fontWeight: FontWeight.bold,
                              color: AllColor.greencolor
                       ),),
                 ),
                 SizedBox(width: SizeConfig.screenwidth*0.02,),
                 Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                              Text("theessentials",style: TextStyle(fontSize: SizeConfig.screenheight*0.02),),
                              Text("Offline")
                       ],
                 )
           ],
         ),
         Icon(Icons.shopping_cart)
                 ],
           ),
         ),
       ),
        
        //////////////
        Divider(thickness: 1,),
          Card(
     elevation: 5,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
      Radius.circular(SizeConfig.screenheight*0.02)
      )
     ),
     child: Container(
      height: SizeConfig.screenheight*0.15,
      width: SizeConfig.screenwidth,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
      Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Padding(
      padding:EdgeInsets.all(SizeConfig.screenwidth*0.02),
      child: Row(
                 
     children: [
      Container(
     height: SizeConfig.screenheight*0.12,
     width: SizeConfig.screenwidth*0.3,
     decoration: BoxDecoration(
                 color: AllColor.lightbluecolor,
     borderRadius: BorderRadius.all(
     Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Image.asset("assets/photo2.png"),
      ),

      SizedBox(width: SizeConfig.screenwidth*0.03,),
      Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
                 SizedBox(height: SizeConfig.screenheight*0.01,),
                 Text("Black Cotton Top",style: TextStyle(
     fontSize: SizeConfig.screenheight*0.025,
     fontWeight: FontWeight.bold
                 ),),
                 Text("\$30.00",style: TextStyle(
     fontSize: SizeConfig.screenheight*0.02,
     fontWeight: FontWeight.bold,
     color: AllColor.orangecolor
                 ),),
     ],
      ),
      Align(
     alignment: Alignment.bottomRight,
     child: Text("Add to Cart",style: TextStyle(
                 fontSize: SizeConfig.screenheight*0.02,
                 color: AllColor.greencolor
     ),))
     ],
      ),
      ),
     ),
      ),
           SizedBox(height: SizeConfig.screenheight*0.025,),
      Text("Tuesday,9:20AM",style: TextStyle(
     color: AllColor.black12color
      ),),

      
      Padding(
     padding:  EdgeInsets.only(
      top:SizeConfig.screenheight*0.01,
      left: SizeConfig.screenheight*0.01,
     
      bottom: SizeConfig.screenheight*0.015 
     ),
     child: Align(
      alignment: Alignment.topLeft,
                 child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.all(
     Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Container(
     height: SizeConfig.screenheight*0.2,
     width: SizeConfig.screenwidth*0.7,
     child: Padding(
      padding:  EdgeInsets.all(
     SizeConfig.screenheight*0.02
      ),
      child: Column(
     children: [
                 Row(
     children: [
                 Text("Warning",style: TextStyle(
                 fontSize: SizeConfig.screenheight*0.022,
                 fontWeight: FontWeight.bold,color: Colors.black54
                 ),),
                 Text(" - Kindly do not share any",
                 style: TextStyle(
                 fontSize: SizeConfig.screenheight*0.018,
                 color: Colors.black26
                 ),)
     ],
                 ),
                 Text("personal details.Only buy/sell through SHOFRI and do not transact outside as it may lead into fraud.Kindly pay/order/book securely only through the SHOFRI app."
                 ,maxLines: 6,
                 style: TextStyle(
     color: Colors.black26,
     fontSize: SizeConfig.screenheight*0.018
                 ),
                 )
     ],
      ),
     ),
      ),
      ),
     ),
      ),
        Align(
     alignment: Alignment.bottomRight,
                 child: Container(
      height: SizeConfig.screenheight*0.16,
      width: SizeConfig.screenwidth*0.35,
      decoration: BoxDecoration(
      color: AllColor.greycolor.shade200,
     borderRadius: BorderRadius.all(
     Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Padding(
     padding: EdgeInsets.only(
      top: SizeConfig.screenheight*0.005,
      bottom: SizeConfig.screenheight*0.005,
     ),
     child: Image.asset("assets/dress.png",fit: BoxFit.contain,),
      ),
      
     ),
      ),
      SizedBox(height: SizeConfig.screenheight*0.11,),

              ],
            ),
     ),
    
////
     Container(
       child: Column(
         children: [
           ListView(
                 shrinkWrap: true,
                 children: [

   
      
      SingleChildScrollView(
     scrollDirection: Axis.horizontal,
                 child: Padding(
      padding:  EdgeInsets.only(
      left: SizeConfig.screenwidth*0.03
      ),
      child: Row(
      children: [
     Container(
      height: SizeConfig.screenheight*0.035,
      width: SizeConfig.screenwidth*0.43,
      decoration: BoxDecoration(
      border: Border.all(
     width: 1,
     color: AllColor.yellowcolor
      ),
     borderRadius: BorderRadius.all(
     Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Center(child: Text("Is this product available?",
      style: TextStyle(
     fontSize: SizeConfig.screenheight*0.017
      ),
      )),
     ),
     SizedBox(width: SizeConfig.screenwidth*0.01),
     Container(
      height: SizeConfig.screenheight*0.035,
      width: SizeConfig.screenwidth*0.38,
      decoration: BoxDecoration(
      border: Border.all(
     width: 1,
     color: AllColor.yellowcolor
      ),
     borderRadius: BorderRadius.all(
     Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Center(child: Text("Share me more pic",
      style: TextStyle(
     fontSize: SizeConfig.screenheight*0.017
      ),
      )),
     ),
     SizedBox(width: SizeConfig.screenwidth*0.01),
     Container(
      height: SizeConfig.screenheight*0.035,
      width: SizeConfig.screenwidth*0.38,
      decoration: BoxDecoration(
      border: Border.all(
     width: 1,
     color: AllColor.yellowcolor
      ),
     borderRadius: BorderRadius.all(
     Radius.circular(SizeConfig.screenheight*0.02)
      )
      ),
      child: Center(child: Text("Share me more pic",
      style: TextStyle(
     fontSize: SizeConfig.screenheight*0.017
      ),
      )),
     ),
      ],
      ),
     ),
      ),
      SizedBox(height: SizeConfig.screenheight*0.005),
      Expanded(
      child: Padding(
      padding: EdgeInsets.only(
    left: SizeConfig.screenwidth*0.03,
    right: SizeConfig.screenwidth*0.02,
    bottom: SizeConfig.screenwidth*0.02,
    top: SizeConfig.screenwidth*0.02,
      ),
      child: Row(
      children: [
                 Container(
     height: SizeConfig.screenheight*0.055,
      width: SizeConfig.screenwidth*0.11,
      decoration: BoxDecoration(
     shape: BoxShape.circle,
     border: Border.all(
      width: 1,
      color: AllColor.yellowcolor
     ),
                 
      ),
      child: Center(child: Icon(Icons.camera_alt,
      size: SizeConfig.screenheight*0.03,
      color:AllColor.yellowcolor)),
                 ),
     SizedBox(width: SizeConfig.screenwidth*0.03,),
                 //

                Expanded(
      child: Container(
     height: SizeConfig.screenheight*0.06,
     child: TextFormField(
                
     decoration: InputDecoration(
     border: UnderlineInputBorder(
                 borderRadius: BorderRadius.circular(
                 SizeConfig.screenwidth*0.08
                 ),
                 borderSide: BorderSide.none,
     ),
     hintText: "Type your message",
     suffixIcon: Icon(
                 Icons.send,
                 color: AllColor.yellowcolor,
     ),
     filled: true,
     ),
                ),
      ),
                ),
      ],
      ),
     ),
      )
      
                 ],
                 ),
         ],
       ),
     )
        ],
      ),
              ],
            ),
        
      ),
    );
  }
}