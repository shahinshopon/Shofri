import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/personalinformation.dart';
import 'package:shofri/UI/ProfilePage/supportteampage.dart';
import 'package:shofri/UI/widget/product_card.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenheight * 0.5,
                child: Image.asset(
                  "assets/details.png",
                  fit: BoxFit.fill,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: SizeConfig.screenheight),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(SizeConfig.screenheight * 0.02),
                          topRight:
                              Radius.circular(SizeConfig.screenheight * 0.02))),
                  child: Container(
                    height: SizeConfig.screenheight * 0.5,
                    width: SizeConfig.screenwidth,
                    decoration: BoxDecoration(
                        color: AllColor.whitecolor,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(SizeConfig.screenheight * 0.02),
                            topRight: Radius.circular(
                                SizeConfig.screenheight * 0.02))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenwidth * 0.02,
                          top: SizeConfig.screenheight * 0.01,
                          right: SizeConfig.screenwidth * 0.015),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fashion 3D Top",
                                style: TextStyle(
                                    fontSize: SizeConfig.screenheight * 0.028,
                                    color: AllColor.blackcolor)),
                            Text("Women Top",
                                style: TextStyle(
                                    fontSize: SizeConfig.screenheight * 0.017,
                                    color: AllColor.blackcolor)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("₹49.99",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.screenheight * 0.028,
                                        color: AllColor.orangecolor,
                                        fontWeight: FontWeight.bold)),
                                Column(
                                  children: [
                                    Container(
                                      height: SizeConfig.screenheight * 0.025,
                                      width: SizeConfig.screenwidth * 0.13,
                                      decoration: BoxDecoration(
                                          color: AllColor.greencolor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.screenheight *
                                                      0.01))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("4.9",
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenheight *
                                                          0.014,
                                                  color: AllColor.whitecolor)),
                                          Icon(
                                            Icons.star,
                                            color: AllColor.whitecolor,
                                            size:
                                                SizeConfig.screenheight * 0.015,
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text("Read all 124 review",
                                            style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenheight *
                                                      0.014,
                                            )),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: SizeConfig.screenheight * 0.021,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text("SELECT COLOR",
                                style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.018,
                                )),
                            SizedBox(
                              height: SizeConfig.screenheight * 0.01,
                            ),
                            Row(
                              children: [
                                DetaillsPageCircleAvatar(
                                  color: Color(0xffD1B3D1),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenwidth * 0.045,
                                ),
                                DetaillsPageCircleAvatar(
                                  color: Color(0xffFF8C69),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenwidth * 0.045,
                                ),
                                DetaillsPageCircleAvatar(
                                  color: Color(0xff67B5F7),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenwidth * 0.045,
                                ),
                                DetaillsPageCircleAvatar(
                                  color: Color(0xffFF8C69),
                                ),
                                SizedBox(
                                  width: SizeConfig.screenwidth * 0.045,
                                ),
                                DetaillsPageCircleAvatar(
                                  color: Color(0xff67B5F7),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.screenheight * 0.025),
                            Text("SELECT SIZE (US)",
                                style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.018,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                DetailspageCard(
                                  text: "XL",
                                ),
                                DetailspageCard(
                                  text: "L",
                                ),
                                DetailspageCard(
                                  text: "M",
                                ),
                                DetailspageCard(
                                  text: "S",
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.screenheight * 0.015),
                            Text("PRODUCT DESCRIPTION",
                                style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.019,
                                )),
                            SizedBox(height: SizeConfig.screenheight * 0.005),
                            Card(
                              child: Container(
                                height: SizeConfig.screenheight * 0.095,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.store,
                                            size: SizeConfig.screenheight *
                                                0.042),
                                        Text("Store",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.screenheight *
                                                        0.022,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SupportteamPage()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.message,
                                              size: SizeConfig.screenheight *
                                                  0.04),
                                          Text("Contact",
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenheight *
                                                          0.022,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: SizeConfig.screenheight * 0.055,
                                      width: SizeConfig.screenwidth * 0.27,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF8991D),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                SizeConfig.screenheight *
                                                    0.025)),
                                      ),
                                      child: Center(
                                        child: Text("ADD TO CART",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.screenheight *
                                                        0.018,
                                                color: AllColor.whitecolor,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInformation()));
                                      },
                                                                          child: Container(
                                        height: SizeConfig.screenheight * 0.055,
                                        width: SizeConfig.screenwidth * 0.25,
                                        decoration: BoxDecoration(
                                          color: Color(0xff27BC1C),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.screenheight *
                                                      0.025)),
                                        ),
                                        child: Center(
                                          child: Text("BUY NOW",
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.screenheight *
                                                          0.018,
                                                  color: AllColor.whitecolor,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenheight * 0.025),
                            Text("RELATED PRODUCTS",
                                style: TextStyle(
                                    fontSize: SizeConfig.screenheight * 0.02,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProductCard(
                                  cardWidth: SizeConfig.screenwidth * 0.4,
                                  asset: "assets/dress.png",
                                  assetHeight: SizeConfig.screenheight * 0.1,
                                  assetWidth: SizeConfig.screenwidth * 0.25,
                                  price: 49.99,
                                  productName: "Floral Grey Full Dress",
                                ),
                                ProductCard(
                                  cardWidth: SizeConfig.screenwidth * 0.4,
                                  asset: "assets/dress.png",
                                  assetHeight: SizeConfig.screenheight * 0.1,
                                  assetWidth: SizeConfig.screenwidth * 0.25,
                                  price: 49.99,
                                  productName: "Floral Grey Full Dress",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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

class DetailspageCard extends StatelessWidget {
  DetailspageCard({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.screenheight * 0.01))),
      child: Container(
        height: SizeConfig.screenheight * 0.065,
        width: SizeConfig.screenwidth * 0.2,
        child: Center(
          child: Text(text,
              style: TextStyle(
                fontSize: SizeConfig.screenheight * 0.025,
              )),
        ),
      ),
    );
  }
}

class DetaillsPageCircleAvatar extends StatelessWidget {
  DetaillsPageCircleAvatar({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: SizeConfig.screenheight * 0.032,
      backgroundColor: color,
    );
  }
}
