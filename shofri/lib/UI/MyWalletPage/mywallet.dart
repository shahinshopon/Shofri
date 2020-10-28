import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/CustomWidget/mywalletcard.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class MyWalletPage extends StatefulWidget {
  @override
  _MyWalletPageState createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AllColor.orangecolor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "MY WALLET",
            style: TextStyle(
              fontSize: SizeConfig.screenheight * 0.025,
              color: AllColor.blackcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
          backgroundColor: AllColor.whitecolor,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenwidth * 0.07),
                child: Text("Last Statement Outstanding",
                    style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.017,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenwidth * 0.062),
                child: Text("\$85,625",
                    style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.04,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                height: SizeConfig.screenheight * 0.2,
                width: SizeConfig.screenwidth,
                color: AllColor.whitecolor,
                child: Image.asset(
                  "assets/linechart.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenheight * 0.013,
              ),
              Center(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: SizeConfig.screenheight * 0.13,
                    width: SizeConfig.screenwidth * 0.37,
                    color: AllColor.whitecolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.screenheight * 0.035,
                          backgroundColor: AllColor.greycolor.shade200,
                          child: Icon(
                            Icons.add,
                            size: SizeConfig.screenheight * 0.05,
                            color: Color(0xffDC4BF8),
                          ),
                        ),
                        Text(
                          "Load Money",
                          style: TextStyle(
                              fontSize: SizeConfig.screenheight * 0.023,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.screenheight * 0.015),
                child: Text(
                  "Recent Transection",
                  style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
              ),
              MyWalletCard(
                text: "Money added to wallet",
                color:AllColor.greencolor,
              ),
              MyWalletCard(
                text: "Order ID 223451",
                color:Color(0xffFF0000),
              ),
              MyWalletCard(
                text: "Order ID 223451",
                color:Color(0xffFF0000),
              ),
              MyWalletCard(
                text: "Money added to wallet",
                color:AllColor.greencolor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
