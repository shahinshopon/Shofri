import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                width: SizeConfig.screenwidth,
                height: SizeConfig.screenheight,
                color: AllColor.lightbluecolor,
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + SizeConfig.screenheight*0.012,
                left: SizeConfig.screenwidth*0.05,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.screenwidth*0.01),
                        decoration: BoxDecoration(
                          color:AllColor.whitecolor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AllColor.bluegreycolor,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenwidth*0.04),
                    Text(
                      "Black Cotton Top",
                      style: Theme.of(context).textTheme.headline6.apply(
                            color: AllColor.whitecolor,
                          ),
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.8,
                minChildSize: 0.4,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeConfig.screenheight*0.04),
                        topRight: Radius.circular(SizeConfig.screenheight*0.04),
                      ),
                      color:AllColor.whitecolor,
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding:  EdgeInsets.only(
                          top: SizeConfig.screenheight*0.07,
                          right: SizeConfig.screenwidth*0.04,
                          left: SizeConfig.screenwidth*0.04,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Ordered on 16 July 11:40",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color:AllColor.greycolor.shade500),
                                ),
                                Text(
                                  "Order ID 223451",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color:AllColor.greycolor.shade500),
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.02),
                            Text(
                              "Black Cotton Top",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: SizeConfig.screenheight*0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "₹30.40",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: AllColor.orangecolor,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qnt.1",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .apply(color: AllColor.greycolor.shade500),
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Visiting Time",
                                  style:
                                      Theme.of(context).textTheme.headline6.apply(
                                            color: AllColor.redacentcolor,
                                          ),
                                ),
                              ],
                            ),
                             SizedBox(height:SizeConfig.screenheight*0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: AllColor.redacentcolor,
                                ),
                                 SizedBox(width:SizeConfig.screenwidth*0.04),
                                CountdownFormatted(
                                  duration: Duration(hours: 6),
                                  builder: (BuildContext ctx, String remaining) {
                                    return Text(
                                      remaining + "s",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                            color:AllColor.redacentcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.02),
                            Text(
                              "Colour selected by customer",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .apply(color: AllColor.greycolor.shade500),
                            ),
                             SizedBox(height:SizeConfig.screenheight*0.02),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.screenheight*0.065
                                  ),
                                  child: Container(
                                    width: SizeConfig.screenwidth*0.18,
                                    margin: EdgeInsets.only(bottom: SizeConfig.screenwidth*0.015),
                                    decoration: BoxDecoration(
                                      color:AllColor.transparentcolor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AllColor.deeporangecolor,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius:SizeConfig.screenheight*0.028,
                                      backgroundColor: Colors.deepOrange[300],
                                    ),
                                  ),
                                ),
                                 SizedBox(width: SizeConfig.screenwidth*0.02),
                                Text(
                                  "Orange",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color:AllColor.greycolor.shade500),
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.005),
                            Text(
                              "Size selected by customer",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .apply(color:AllColor.greycolor.shade500),
                            ),
                             SizedBox(height:SizeConfig.screenheight*0.02),
                            Container(
                              width:SizeConfig.screenwidth*0.25,
                              height: SizeConfig.screenheight*0.062,
                              child: Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.screenwidth*0.04
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "L",
                                    style: TextStyle(
                                      fontSize: SizeConfig.screenheight*0.022,
                                      color:AllColor.deeporangecolor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Visiting Time",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color:AllColor.greycolor[700]),
                                ),
                                Text(
                                  "Thursday 11 PM",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color:AllColor.greycolor.shade400),
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "OTP Verification",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color: AllColor.greycolor[700]),
                                ),
                                Text(
                                  "1234",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Payment Status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color:AllColor.greycolor[700]),
                                ),
                                Text(
                                  "Unpaid",
                                  style:
                                      Theme.of(context).textTheme.subtitle1.apply(
                                            color:AllColor.redcolor,
                                          ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.screenheight*0.04),
                            FlatButton(
                              color: AllColor.greencolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.screenheight*0.02
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Download Invoice",
                                style:
                                    Theme.of(context).textTheme.headline6.apply(
                                          color: AllColor.whitecolor,
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  color:AllColor.orangecolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(SizeConfig.screenheight*0.02),
                      bottomLeft: Radius.circular(SizeConfig.screenheight*0.02),
                      bottomRight: Radius.circular(SizeConfig.screenheight*0.02),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Confirm Order",
                    style: Theme.of(context).textTheme.headline6.apply(
                          color: AllColor.whitecolor,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
