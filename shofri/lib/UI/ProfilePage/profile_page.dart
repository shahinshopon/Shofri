import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/manageprofile.dart';

class ProfilePage extends StatefulWidget {
  final ScrollController controller;

   ProfilePage({Key key, this.controller}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   
 bool _value=false;
  @override
  Widget build(BuildContext context) {
    
   

    return SafeArea(
          child: Scaffold(
        backgroundColor: AllColor.whitecolor,
        body: Container(
          child: SingleChildScrollView(
            controller: widget.controller,
            child: Column(
              children: [
                 SizedBox(height:SizeConfig.screenheight*0.01),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Image.asset(
                      "assets/profile-wallpaper.png",
                      width: SizeConfig.screenwidth,
                    ),
                    Positioned(
                      top: SizeConfig.screenheight* 0.028,
                      right: SizeConfig.screenwidth* 0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.screenheight*0.06,
                            backgroundColor: AllColor.ambercolor.shade300,
                          ),
                          Text(
                            "Jane Doe",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "janedoe123@email.com",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          SizedBox(height: SizeConfig.screenheight*0.01),
                          MaterialButton(
                            onPressed: () {},
                            child: Text("EDIT PROFILE",
                                style: TextStyle(
                                  color: AllColor.whitecolor,
                                  fontSize:SizeConfig.screenheight*0.015,
                                )),
                            color: AllColor.blackcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.screenwidth*0.08
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top:SizeConfig.screenheight*0.062,
                      right: 2,
                      child: Row(
                        children: [
                          Badge(
                            child: Icon(
                              Icons.favorite_border,
                            ),
                            badgeColor: AllColor.orangecolor,
                           // position: BadgePosition.bottomLeft(),
                           position: BadgePosition.bottomStart(),
                            badgeContent:
                                Text("5", style: TextStyle(color:AllColor.whitecolor)),
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          Badge(
                            child: Icon(
                              Icons.shopping_cart,
                            ),
                            badgeColor: AllColor.orangecolor,
                            position: BadgePosition.bottomStart(),
                           // position: BadgePosition.bottomLeft(),
                            badgeContent:
                                Text("5", style: TextStyle(color:AllColor.whitecolor)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:SizeConfig.screenheight*0.01,
                    horizontal:SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenwidth*0.02
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: SizeConfig.screenheight*0.01),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Icon(Icons.launch),
                          title: Text("Night Mode"),
                          trailing:Switch(value: _value,
                           onChanged: (bool val){
                             setState(() {
                               _value=val;
                             });
                           })
                        ),
                        Container(
                          color: AllColor.greycolor.shade300,
                          height: 2,
                          margin: EdgeInsets.only(
                            right: SizeConfig.screenwidth*0.04,
                            left: SizeConfig.screenwidth*0.18,
                          ),
                        ),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.payment, "Purchase History"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Icon(Icons.favorite_border),
                          title: Text("Wishlist"),
                          trailing: ClipOval(
                            child: Container(
                              color: AllColor.greycolor.shade200,
                              child: Icon(
                                Icons.navigate_next,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight*0.005),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:SizeConfig.screenheight*0.01,
                    horizontal: SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenwidth*0.02
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.group, "Following"),
                        SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.chat_bubble_outline, "Conversation"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageProfile()));
                          },
                          child: _buildMenu(Icons.block, "Manage Profile")),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(
                            Icons.account_balance, "My Wallet"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Icon(Icons.info_outline),
                          title: Text("Support Ticket"),
                          trailing: ClipOval(
                            child: Container(
                              color:AllColor.greycolor.shade200,
                              child: Icon(
                                Icons.navigate_next,
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: SizeConfig.screenheight*0.005),
                      ],
                    ),
                  ),
                ),
                 SizedBox(height: SizeConfig.screenheight*0.01),
                Container(
                  width: SizeConfig.screenwidth * 0.5,
                  height: SizeConfig.screenheight*0.062,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          SizeConfig.screenheight*0.02
                        ),
                        bottomLeft: Radius.circular(
                          SizeConfig.screenheight*0.02
                        ),
                        bottomRight: Radius.circular(
                          SizeConfig.screenheight*0.02
                        ),
                      ),
                      gradient: LinearGradient(
                          colors: [AllColor.blackcolor, AllColor.orangecolor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft),
                      boxShadow: [
                        BoxShadow(
                          color: AllColor.greycolor[500],
                          offset: Offset(0.0, 1.5),
                          blurRadius: 1.5,
                        ),
                      ]),
                  child: Material(
                    color:AllColor.transparentcolor,
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, "/register-seller"),
                      child: Center(
                        child: Text(
                          "Be a Seller",
                          style: Theme.of(context).textTheme.headline6.apply(
                                color: AllColor.whitecolor,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenheight*0.01),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard,
                    color: AllColor.orangecolor,
                  ),
                  label: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.headline6.apply(
                          color:AllColor.orangecolor,
                        ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(
    IconData leading,
    String title,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          visualDensity: VisualDensity(vertical: -4),
          leading: Icon(leading),
          title: Text(title),
          trailing: ClipOval(
            child: Container(
              color: AllColor.greycolor.shade200,
              child: Icon(
                Icons.navigate_next,
              ),
            ),
          ),
        ),
        Container(
          color:AllColor.greycolor.shade300,
          height: 2,
          margin: EdgeInsets.only(
            right: SizeConfig.screenwidth*0.04,
            left: SizeConfig.screenwidth*0.18,
          ),
        ),
      ],
    );
  }
}
