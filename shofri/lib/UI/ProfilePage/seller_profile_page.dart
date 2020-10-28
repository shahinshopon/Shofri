import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/SupportTicket/supportticket.dart';

class SellerProfilePage extends StatefulWidget {
  final ScrollController controller;

  const SellerProfilePage({Key key, this.controller}) : super(key: key);

  @override
  _SellerProfilePageState createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  
  
  bool _value=false;
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor:AllColor.whitecolor,
        body: Container(
          child: SingleChildScrollView(
            controller: widget.controller,
            child: Column(
            
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Image.asset(
                      "assets/seller-profile-wallpaper.png",
                      width: SizeConfig.screenwidth,
                    ),
                    Positioned(
                      top: SizeConfig.screenheight * 0.035,
                      right: SizeConfig.screenwidth * 0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: SizeConfig.screenheight*0.01),
                          CircleAvatar(
                            radius: SizeConfig.screenheight*0.06,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                  Radius.circular(
                    SizeConfig.screenheight*0.63
                  )
                ),
                              child: Image.asset("assets/photo.png",fit: BoxFit.fill,)),
                          ),
                          Text(
                            "Jane Doe",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                           SizedBox(height: SizeConfig.screenheight*0.005),
                          Text(
                            "Seller",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                           SizedBox(height: SizeConfig.screenheight*0.005),
                          Text(
                            "janedoe123@email.com",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.screenheight*0.05,
                      right: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: AllColor.greycolor,
                            size: SizeConfig.screenheight*0.04,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                
                Container(
                  width: SizeConfig.screenwidth,
                  height: SizeConfig.screenheight * 0.09,
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenheight*0.005,
                    horizontal: SizeConfig.screenwidth*0.04,
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenheight*0.01
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/verification");
                    },
                    child: Row(
                      children: [
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        Image.asset(
                          "assets/non_verified.png",
                          // width: 32,
                        ),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Kindly Verify your seller account ",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                      color:AllColor.blackcolor,
                                      fontWeight: FontWeight.bold),
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.005),
                            Container(
                              height: 2,
                              width: SizeConfig.screenwidth* 0.5,
                              color: AllColor.greycolor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: SizeConfig.screenheight*0.0025,
                    horizontal: SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenheight*0.01
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        _buildMenuTotal(
                            3, "Total Products", "/products", context),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        _buildMenuTotal(
                            0, "Pending Orders", "/my-order", context),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        _buildMenuTotal(
                            0, "Sucessful Orders", "/my-order", context),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        _buildMenuTotal(3, "Cancel Orders", "/my-order", context),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenwidth,
                  height: SizeConfig.screenheight * 0.09,
                  padding:  EdgeInsets.symmetric(
                    vertical: SizeConfig.screenheight*0.005,
                    horizontal: SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 0,
                    color: AllColor.lightbluecolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenheight*0.01
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: SizeConfig.screenwidth*0.02),
                        Image.asset(
                          "assets/coins.png",
                          width: SizeConfig.screenwidth*0.06,
                        
                        ),
                         SizedBox(width: SizeConfig.screenwidth*0.02),
                        Text(
                          "Total Earning: ",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AllColor.whitecolor,
                               fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹ 350,000",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AllColor.whitecolor,
                               fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/withdraw"),
                  child: Container(
                    width: SizeConfig.screenwidth,
                    height: SizeConfig.screenheight * 0.08,
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenheight*0.005,
                      horizontal:SizeConfig.screenwidth*0.04,
                    ),
                    child: Card(
                      elevation: 0,
                      color: AllColor.redacentcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.screenheight*0.01
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: SizeConfig.screenwidth*0.02),
                          Image.asset(
                            "assets/money.png",
                            width: SizeConfig.screenwidth*0.06,
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          Text(
                            "Last Month Earning: ",
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: AllColor.whitecolor,
                                 fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹ 350,000",
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color:AllColor.whitecolor,
                                 fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenwidth,
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenheight*0.005,
                    horizontal:SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenheight*0.01
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMenuIcon(context, "assets/shopping-cart.png", "Product",
                                "/product"),
                            _buildMenuIcon(context, "assets/add-order.png",
                                "Add Offer", "/add-offer"),
                            _buildMenuIcon(context, "assets/order.png", "Orders",
                                "/my-order"),
                          ],
                        ),
                         SizedBox(height: SizeConfig.screenheight*0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMenuIcon(
                                context,
                                "assets/shop-settings.png",
                                "Shop Settings",
                                "/shop-settings"),
                            _buildMenuIcon(context, "assets/qr-code.png",
                                "QR Code", "/qr-code"),
                            _buildMenuIcon(context, "assets/money-withdraw.png",
                                "Money Withdraw", "/withdraw"),
                          ],
                        ),
                        SizedBox(height: SizeConfig.screenheight*0.01),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/public-shop"),
                  child: Container(
                    width: SizeConfig.screenwidth,
                    height: SizeConfig.screenheight * 0.09,
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenheight*0.01,
                      horizontal:SizeConfig.screenwidth*0.04,
                    ),
                    child: Card(
                      elevation: 0,
                      color: AllColor.purplecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.screenheight*0.01
                        ),
                      ),
                      child: Row(
                        children: [
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          SvgPicture.asset(
                            "assets/shopping-cart.svg",
                            width: SizeConfig.screenwidth*0.06,
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          Text(
                            "Shop Public Profile",
                            style: Theme.of(context).textTheme.headline6.copyWith(
                                color: AllColor.whitecolor, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(width: SizeConfig.screenwidth*0.14),
                          Expanded(
                            child: Icon(
                              Icons.navigate_next,
                              size: SizeConfig.screenheight*0.04,
                              color: AllColor.whitecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: SizeConfig.screenheight*0.01,
                    horizontal:SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenheight*0.01
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Icon(Icons.block),
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
                            left:SizeConfig.screenheight*0.18,
                          ),
                        ),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.monetization_on, "Purchase History",
                            context, "/purchase-history"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(
                            Icons.group, "Followers", context, "/followers"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.group, "Following", context,
                            "/following"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        ListTile(
                          visualDensity: VisualDensity(vertical: -4),
                          leading: Icon(Icons.favorite_border),
                          title: Text("Wishlist"),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenheight*0.01,
                    horizontal: SizeConfig.screenwidth*0.04,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenheight*0.01
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.payment, "Payment History",
                            context, "/payment-history"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.block, "Manage Profile",
                            context, "/manage-profile"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.monetization_on, "Earnings",
                            context, "/withdraw"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        _buildMenu(Icons.account_balance,
                            "My Wallet", context, "/wallet"),
                         SizedBox(height: SizeConfig.screenheight*0.01),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportTicket()));
                          },
                                                  child: ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            leading: Icon(Icons.info_outline),
                            title: Text("Support Ticket"),
                            trailing: ClipOval(
                              child: Container(
                                color: AllColor.greycolor.shade200,
                                child: Icon(
                                  Icons.navigate_next,
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height:SizeConfig.screenheight*0.005),
                      ],
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

  Widget _buildMenuIcon(BuildContext context, String assetName,
      String description, String route) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, route),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenheight*0.04
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:AllColor.transparentcolor,
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                padding: EdgeInsets.all(
                  SizeConfig.screenheight*0.01
                ),
                child:Image.asset(
                  assetName,
                  height: SizeConfig.screenheight*0.035,
                ),
              ),
            ),
          ),
          Text(
            "$description",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTotal(
    int total,
    String description,
    String routeName,
    BuildContext context,
  ) 
  {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Column(
          children: [
            Text(
              "$total",
              style: TextStyle(fontSize: SizeConfig.screenheight*0.025, fontWeight: FontWeight.bold),
            ),
            Text(
              "$description",
              style: TextStyle(fontSize: SizeConfig.screenheight*0.018),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(
    IconData leading,
    String title,
    BuildContext context,
    String routeName,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () => Navigator.pushNamed(context, routeName),
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
          color: AllColor.greycolor.shade300,
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
