import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/CustomWidget/manageprofilecontainer.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';


class ManageProfile extends StatefulWidget {
  @override
  _ManageProfileState createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
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
        body: Column(
          children: [
            Container(
             height: SizeConfig.screenheight*0.1,
             color: AllColor.blackcolor,
              ),
            Stack(
              overflow: Overflow.visible,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                 child: Container(
             //height:SizeConfig.screenheight*0.78 ,
              child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenheight*0.075),
                    Text("Jane Doe",style: TextStyle(fontSize: SizeConfig.screenheight*0.035,
                    fontWeight: FontWeight.bold
                    )),
                    Text("Seller"),
                    Text("janedoe123@gmail.com"),
                    Divider(thickness: 1,),
                    Padding(
                      padding: EdgeInsets.only(
                       right: SizeConfig.screenheight*0.02,
                       left: SizeConfig.screenheight*0.022,
                       bottom: SizeConfig.screenheight*0.01,
                       top: SizeConfig.screenheight*0.01,
                        ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ManageProfileContainer(
                              image: "assets/men1.png",
                              titletext:"Amanda Smith" ,
                              subtitletext:"@ama_ndas" ,
                            ),
                            Divider(thickness: 1,color: AllColor.black12color,),
                            ManageProfileContainer(
                              image: "assets/men2.png",
                              titletext:"Oliver Bennett" ,
                              subtitletext:"@oliVer" ,
                            ),
                            Divider(thickness: 1,color: AllColor.black12color,),
                            ManageProfileContainer(
                              image: "assets/men3.png",
                              titletext:"Harry Parry" ,
                              subtitletext:"@haRRyP" ,
                            ),
                            Divider(thickness: 1,color: AllColor.black12color,),
                            ManageProfileContainer(
                              image: "assets/men1.png",
                              titletext:"Amanda Smith" ,
                              subtitletext:"@ama_ndas" ,
                            ),
                            Divider(thickness: 1,color: AllColor.black12color,),
                            ManageProfileContainer(
                               image: "assets/men2.png",
                              titletext:"Oliver Bennett" ,
                              subtitletext:"@oliVer" ,
                            ),
                            Divider(thickness: 1,color: AllColor.black12color,),
                            ManageProfileContainer(
                              image: "assets/men3.png",
                              titletext:"Harry Parry" ,
                              subtitletext:"@haRRyP" ,
                            ),
                          ],
                        )),
                    )
                  ],
              ),
            ),
                ),
            Positioned(
              top: -SizeConfig.screenheight*0.065,
              left: SizeConfig.screenwidth*0.36,
              child: CircleAvatar(
              radius: SizeConfig.screenheight*0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    SizeConfig.screenheight*0.63
                  )
                ),
                child: Image.asset("assets/photo.png",fit: BoxFit.fill,)),
              backgroundColor: AllColor.transparentcolor,
            ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
