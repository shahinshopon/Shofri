import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  bool _value=false;

  File _image;
  Future GallaryImage()async{
    var image=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: AllColor.whitecolor,),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff413434),
                Color(0xff49367C)
              ])
            )
          ),
          title: Text("Personal Information",style: TextStyle(
           fontSize: SizeConfig.screenheight*0.022,
           color: AllColor.whitecolor
          ),
          
        ),
      ),
      body: Column(
        children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenwidth*0.05,
                  right: SizeConfig.screenwidth*0.03,
                  top: SizeConfig.screenheight*0.015,
                  bottom: SizeConfig.screenheight*0.01
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.screenheight*0.01,),
                    Text("Let's start with basic personal details",style: TextStyle(
           fontSize: SizeConfig.screenheight*0.02,
           fontWeight: FontWeight.bold,
           color: Colors.black54
          ),),
          SizedBox(height: SizeConfig.screenheight*0.01,),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Offline e-Kyc generated via UIDAI",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.02,
               fontWeight: FontWeight.bold,
               color: Colors.black54
          ),),
          Container(
            height: SizeConfig.screenheight*0.04,
            width: SizeConfig.screenwidth*0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,color: AllColor.black12color
              )
            ),
            child: Center(child: Icon(Icons.check,color:AllColor.black12color)),
          )
             ],
           ),
           SizedBox(height: SizeConfig.screenheight*0.004,),
              Text("Generated on : 01-Mar-2020 17:23:50",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.017,
               fontWeight: FontWeight.bold,
               color: Colors.black26
          ),),
          SizedBox(height: SizeConfig.screenheight*0.006,),
          Text("Trouble with Aadhaar Offline e-KYC",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.017,
               fontWeight: FontWeight.bold,
               color: Colors.blue
          ),),
          SizedBox(height: SizeConfig.screenheight*0.018,),
          Text("PAN Card Number",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.02,
               fontWeight: FontWeight.bold,
               color: Colors.black26
          ),),
          SizedBox(height: SizeConfig.screenheight*0.006,),
          TextFormField(
                          decoration: InputDecoration(
                             labelStyle: TextStyle(
                              fontSize: SizeConfig.screenheight*0.025
                            ),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.screenwidth*0.015)
                            )
                          ),
                            hintText: "10 digit PAN card number",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight*0.02,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        
                         Text("Upload PAN card Front",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.017,
               fontWeight: FontWeight.bold,
               color: Colors.black12
          ),),
          SizedBox(height: SizeConfig.screenheight*0.004,),
          GestureDetector(
            onTap: (){
              GallaryImage();
            },
                   child: Container(
              height: SizeConfig.screenheight*0.17,
              width: SizeConfig.screenwidth*0.45,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,color: AllColor.black12color
                )
              ),
              child: Center(child: Container(
                 height: SizeConfig.screenheight*0.09,
               width: SizeConfig.screenwidth*25,
                child: Image.asset("assets/idcard.png",color: Colors.black12,)),
            ),)
          )
                       ],
                     ),

                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         
                         Text("Click Your Selfi",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.017,
               fontWeight: FontWeight.bold,
               color: Colors.black12
          ),),
         SizedBox(height: SizeConfig.screenheight*0.004,),
          GestureDetector(
            onTap: (){
              GallaryImage();
            },
                      child: Container(
              height: SizeConfig.screenheight*0.17,
              width: SizeConfig.screenwidth*0.45,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,color: AllColor.black12color
                )
              ),
             child: Center(child: Container(
               height: SizeConfig.screenheight*0.08,
               width: SizeConfig.screenwidth*25,
               child: Image.asset("assets/selfi.png",color: AllColor.black12color,))),
            ),
          )
                       ],
                     ),
                   ],),

                  SizedBox(height: SizeConfig.screenheight*0.016,),
                   Text("Email",style: TextStyle(
               fontSize: SizeConfig.screenheight*0.017,
               fontWeight: FontWeight.bold,
               color: Colors.black26
          ),),
               SizedBox(height: SizeConfig.screenheight*0.005,),
          TextFormField(
                          decoration: InputDecoration(
                             labelStyle: TextStyle(
                              fontSize: SizeConfig.screenheight*0.025
                            ),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(SizeConfig.screenwidth*0.015)
                            )
                          ),
                            hintText: "Select Email",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                       SizedBox(height: SizeConfig.screenheight*0.017,),
                        Divider(
                          thickness: 1,color: AllColor.black12color,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                    value: _value,
                                    onChanged: (bool val) {
                                      setState(() {
                                        _value=val;
                                      });
                                    },
                                  ),
                            Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.only(
                                    top: SizeConfig.screenheight*0.013
                                  ),
                                  child: Text("I allow you to share my Aadhaar and personal Information with the loan provider por the purpose of verification of my identity and address proff in complience with KYC norms issued by RBI and agree to Terms & Conditions.The same is allowed to beused for MobiKwik Wallet KYC upgrade.",
                              maxLines: 6,
                              style: TextStyle(fontSize: SizeConfig.screenheight*0.017,
                              color: Colors.black54
                              ),
                              ),
                                ),
                            )
                          ],
                        ),
                      
                       
                  ],
                ),
                ),
                Expanded(child: SizedBox()),
                Container(
                 height: SizeConfig.screenheight*0.09,
                 width: SizeConfig.screenwidth,
                 color: AllColor.greycolor,
                 child: Center(child: Text("Continue",
                 style: TextStyle(fontSize: SizeConfig.screenheight*0.022,
                              color: AllColor.whitecolor,
                              fontWeight: FontWeight.bold
                              ),)),
                )
        ],
      ),
    ));
  }
}