
import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';


class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
              backgroundColor: AllColor.blackcolor,
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: AllColor.orangecolor,)),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                          child: Column(
                children: [
                  Container(
               height: SizeConfig.screenheight*0.1,
               color: AllColor.blackcolor,
               child: Center(child: Text("Add Review",
               style: TextStyle(fontSize: SizeConfig.screenheight*0.023,
               fontWeight: FontWeight.bold,
               color:AllColor.whitecolor),)),
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: [
                   Container(
                     child: SingleChildScrollView(
                       scrollDirection: Axis.vertical,
                         child: Column(
                       children: [
                       SizedBox(height: SizeConfig.screenheight*0.11,),
                       Text("Black Cotton Top",
                       style: TextStyle(fontSize: SizeConfig.screenheight*0.023,
               fontWeight: FontWeight.bold,
               )),
               SizedBox(height: SizeConfig.screenheight*0.005,),
                       Text("Operum England",
                       style: TextStyle(fontSize: SizeConfig.screenheight*0.015,
           
               )),
                SizedBox(height: SizeConfig.screenheight*0.05,),
                       Text("HOW WAS YOUR EXPERIENCE?",
                       style: TextStyle(fontSize: SizeConfig.screenheight*0.02,
                         fontWeight: FontWeight.bold
               )),
               SizedBox(height: SizeConfig.screenheight*0.01,),
               Column(
                 children: [
                     ReviewReuseableText(
                       text: "Item as Described:",
                     ),
                     ReviewReuseableText(
                       text: "Communication with Seller:",
                     ),
                     ReviewReuseableText(
                       text: "Shop Collection:",
                     ),
                     ReviewReuseableText(
                       text: "Rate the Product:",
                     )
                 ],
               ),
               Divider(thickness: 1,color: AllColor.black12color,),
               Align(alignment: Alignment.topLeft,
                       child: Padding(
                        padding: EdgeInsets.only(
        top: SizeConfig.screenheight*0.005,
        bottom: SizeConfig.screenheight*0.005,
        left: SizeConfig.screenwidth*0.02,
        right: SizeConfig.screenwidth*0.02
      ),
                        child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                         Text("Write your feedback (Optional)",
           style: TextStyle(fontSize: SizeConfig.screenheight*0.02,
           fontWeight: FontWeight.bold                
                 )),
                 SizedBox(height: SizeConfig.screenheight*0.005,),
                  Text("Enter your review",
           style: TextStyle(fontSize: SizeConfig.screenheight*0.016,
                            
                 )),
                 SizedBox(height: SizeConfig.screenheight*0.005,),
                 Container(
                     height: SizeConfig.screenheight*0.16,
                     decoration: BoxDecoration(
                       border: Border.all(
                        width: 1,
                        color: AllColor.blackcolor
                       )
                     ),
                 ),
                 SizedBox(height: SizeConfig.screenheight*0.015,),
                 Center(
                     child: Container(
                       height: SizeConfig.screenheight*0.16,
                       width: SizeConfig.screenwidth*0.4,
                       decoration: BoxDecoration(
                        color: AllColor.blackcolor,
                        borderRadius: BorderRadius.all(
                         Radius.circular(
                           SizeConfig.screenheight*0.02
                         )
                       ),
                       ),
                       child: Center(
                         child: Icon(Icons.camera_alt,size: SizeConfig.screenheight*0.042,
                         color: AllColor.orangecolor
                         ,),
                       ),
                     ),
                 ),
                 Center(
                   child: Text("Upload Photo",
                    style: TextStyle(fontSize: SizeConfig.screenheight*0.014,
                              
                   )),
                 ),
                 Divider(thickness: 2,color: AllColor.black12color,),
                 SizedBox(height: SizeConfig.screenheight*0.02,),
                 Container(
                   height: SizeConfig.screenheight*0.04,
                       width: SizeConfig.screenwidth,
                       decoration: BoxDecoration(
                        color: AllColor.orangecolor,
                        borderRadius: BorderRadius.all(
                         Radius.circular(
                           SizeConfig.screenheight*0.025
                         )
                       ),
                       ),
                       child: Center(child: Text("Submit",
                       style: TextStyle(
                         fontSize: SizeConfig.screenheight*0.02,
                         fontWeight: FontWeight.bold,
                         color: AllColor.whitecolor
                            
                 ))),
                 )

                     ],
                 ),
                       ),
               )
                       ],
                     ),
                     ),
                   ),
                   Positioned(
                top: -SizeConfig.screenheight*0.035,
                right: SizeConfig.screenwidth*0.345,
                child: Container(
                  height: SizeConfig.screenheight*0.14,
                  width: SizeConfig.screenwidth*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        SizeConfig.screenheight*0.02
                      )
                    ),
                    color: Color(0xff71E2EA)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        SizeConfig.screenheight*0.03
                      )
                    ),
                    child: Image.asset("assets/photo2.png",fit: BoxFit.fill,)),
                ))
                  ],
                )
                ],
              ),
            ),
      ),
    );
  }
}

class ReviewReuseableText extends StatelessWidget {
 ReviewReuseableText({ this.text });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenheight*0.01,
        bottom: SizeConfig.screenheight*0.01,
        left: SizeConfig.screenwidth*0.05,
        right: SizeConfig.screenwidth*0.05
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
           style: TextStyle(fontSize: SizeConfig.screenheight*0.017,                
             )),

             Row(
               children: [
    Icon(Icons.star,color: Color(0xffEEEEEE),size:SizeConfig.screenheight*0.02),
    Icon(Icons.star,color: Color(0xffEEEEEE),size:SizeConfig.screenheight*0.02),
    Icon(Icons.star,color: Color(0xffEEEEEE),size:SizeConfig.screenheight*0.02),
    Icon(Icons.star,color: Color(0xffEEEEEE),size:SizeConfig.screenheight*0.02),
    Icon(Icons.star,color: Color(0xffEEEEEE),size:SizeConfig.screenheight*0.02),

               ],
             )
        ],
      ),
    );
  }
}