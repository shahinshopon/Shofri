import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final data = [
    new LinearSales(0, 5),
    new LinearSales(1, 25),
    new LinearSales(2, 100),
    new LinearSales(3, 75),
  ];

  List<charts.Series<LinearSales, int>> series = [];

  @override
  void initState() {
    series = [
      charts.Series(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(AllColor.orangecolor),
        areaColorFn: (_, __) =>
            charts.ColorUtil.fromDartColor(AllColor.orangecolor.shade100),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  width:SizeConfig.screenwidth,
                  height:SizeConfig.screenheight * 0.32,
                ),
                Container(
                  color: AllColor.rgbocolor,
                  width: SizeConfig.screenwidth,
                  height: SizeConfig.screenheight* 0.2,
                ),
                Positioned(
                  top: SizeConfig.screenheight* 0.08,
                  left: SizeConfig.screenwidth* 0.04,
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: SizeConfig.screenheight*0.04,
                        color:AllColor.whitecolor,
                      ),
                      SizedBox(
                        width:SizeConfig.screenwidth * 0.26,
                      ),
                      Text(
                        "EARNINGS",
                        style: Theme.of(context).textTheme.headline6.apply(
                              color:AllColor.whitecolor,
                            ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: SizeConfig.screenheight*0.15,
                  left: SizeConfig.screenwidth*0.03,
                  child: Container(
                    width: SizeConfig.screenwidth* 0.95,
                    height: SizeConfig.screenheight* 0.12,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.screenheight*0.02
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Revenue",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .apply(
                                        color:AllColor.greycolor.shade400,
                                      ),
                                ),
                                Text(
                                  "₹5.9k",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:AllColor.blackcolor,
                                      ),
                                )
                              ],
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            endIndent: 20,
                            indent: 20,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Balance",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .apply(
                                        color:AllColor.greycolor.shade400,
                                      ),
                                ),
                                Text(
                                  "-₹2.5k",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:AllColor.blackcolor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AllColor.orangecolor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(SizeConfig.screenheight*0.02),
                                  bottomRight: Radius.circular(SizeConfig.screenheight*0.02),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: SizeConfig.screenwidth*0.02),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Send To",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .apply(
                                              color: AllColor.greycolor.shade400,
                                            ),
                                      ),
                                      Text(
                                        "Bank",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:AllColor.whitecolor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.navigate_next,
                                          size:SizeConfig.screenheight*0.04,
                                          color:AllColor.whitecolor,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: SizeConfig.screenwidth * 0.9,
              height: SizeConfig.screenheight* 0.2,
              child: Card(
                elevation: 14,
                child: new charts.LineChart(
                  series,
                  animate: false,
                  defaultRenderer: new charts.LineRendererConfig(
                    includePoints: true,
                    includeArea: true,
                  ),
                  behaviors: [
                    new charts.ChartTitle(
                      'Order Statistic',
                      subTitle: 'Last Week',
                      behaviorPosition: charts.BehaviorPosition.top,
                      titleOutsideJustification:
                          charts.OutsideJustification.start,
                      innerPadding: 18,
                      subTitleStyleSpec: charts.TextStyleSpec(
                        color: charts.ColorUtil.fromDartColor(AllColor.orangecolor),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:SizeConfig.screenheight*0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(width:SizeConfig.screenwidth*0.055),
                Expanded(
                  child: Text(
                    "Due Amount",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.screenheight*0.023,
                    ),
                  ),
                ),
                Text(
                  "₹20.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenheight*0.023,
                  ),
                ),
               SizedBox(width:SizeConfig.screenheight*0.055),
              ],
            ),
            SizedBox(height: SizeConfig.screenheight*0.02),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenheight*0.04
                ),
              ),
              onPressed: () {},
              splashColor:AllColor.orangecolor,
              child: Text(
                "Pay Now",
                style: TextStyle(
                  color: AllColor.ambercolor[700],
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.screenheight*0.023,
                ),
              ),
              color: AllColor.rgbocolor,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:SizeConfig.screenwidth*0.08),
                Text(
                  "Note : Pay your dues if your balance is negative.",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenheight*0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                      fontSize: SizeConfig.screenheight*0.025,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenheight*0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.05),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenwidth*0.2,
                    height: SizeConfig.screenheight*0.1,
                    child: Card(
                      color: AllColor.greencolor,
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
                          "Order on 16 July 11:40",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .apply(color:AllColor.greycolor.shade500),
                        ),
                        SizedBox(height: SizeConfig.screenheight*0.012),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Order ID ",
                                    style: TextStyle(
                                      color: AllColor.greycolor.shade500,
                                    ),
                                  ),
                                  Text(
                                    " 223451",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "₹30.00",
                              style: TextStyle(
                                fontSize: SizeConfig.screenheight*0.017,
                                color: AllColor.greencolor,
                              ),
                            ),
                          SizedBox(width: SizeConfig.screenwidth*0.035),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
