import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class MyOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("New Orders"),
          leading: Icon(Icons.menu),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenwidth*0.04,
            vertical:SizeConfig.screenheight*0.01,
          ),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.screenheight*0.02
              ),
            ),
            child: SingleChildScrollView(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/confirm-order"),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.screenwidth*0.2,
                          height: SizeConfig.screenheight*0.1,
                          child: Card(
                            color:AllColor.greencolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                SizeConfig.screenheight*0.01
                              ),
                            ),
                          ),
                        ),
                         SizedBox(width: SizeConfig.screenwidth*0.01),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               SizedBox(height: SizeConfig.screenheight*0.01),
                              Text(
                                "Black Cotton Top",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "Operum England",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .apply(color:AllColor.greycolor.shade400),
                              ),
                               SizedBox(height: SizeConfig.screenheight*0.0125),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Order on 16 July 11:40",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                 // Spacer(),
                                  Text(
                                    "Order ID 223451",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenheight*0.01),
                    Card(
                      color: AllColor.greycolor.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(SizeConfig.screenheight*0.02),
                          bottomRight: Radius.circular(SizeConfig.screenheight*0.02),
                        ),
                      ),
                      elevation: 4,
                      child: Container(
                        width:SizeConfig.screenwidth,
                        height:SizeConfig.screenheight * 0.08,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Payment",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .apply(color:AllColor.greycolor.shade500),
                                ),
                                Text(
                                  "Unpaid",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:AllColor.redcolor,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Product ID",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .apply(color:AllColor.greycolor.shade500),
                                ),
                                Text(
                                  "TST1234",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Qnt.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .apply(color: AllColor.greycolor.shade500),
                                ),
                                Text(
                                  "1",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Order Status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .apply(color:AllColor.greycolor.shade500),
                                ),
                                Text(
                                  "Pending",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AllColor.orangecolor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
