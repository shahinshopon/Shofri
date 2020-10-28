import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/tabs/home_tab.dart';
import 'package:shofri/UI/ProfilePage/tabs/product_tab.dart';
import 'package:shofri/UI/ProfilePage/tabs/review_tab.dart';
import 'package:shofri/UI/ProfilePage/tabs/top_selling_tab.dart';



class PublicShopPage extends StatefulWidget {
  @override
  _PublicShopPageState createState() => _PublicShopPageState();
}

class _PublicShopPageState extends State<PublicShopPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            SizeConfig.screenheight * 0.37,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      height: SizeConfig.screenheight * 0.26,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/public-shop-wallpaper.png",
                      ),
                    ),
                    Positioned(
                      bottom: SizeConfig.screenheight*0.006,
                      left: SizeConfig.screenwidth*0.025,
                      child: CircleAvatar(
                        radius: SizeConfig.screenheight*0.06,
                        backgroundColor: AllColor.orangecolor.shade300,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.screenheight*0.01),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.navigate_before,
                            color:AllColor.whitecolor,
                            size: SizeConfig.screenheight*0.04,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.screenheight*0.01),
                        child: Icon(
                          Icons.search,
                          color: AllColor.whitecolor,
                          size: SizeConfig.screenheight*0.04,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenheight*0.02),
                        child: Column(
                          children: [
                            Text(
                              "ELEGANCE",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .apply(color: AllColor.whitecolor),
                            ),
                            Text(
                              "All your fashion needs under one roof",
                              style: TextStyle(color: AllColor.whitecolor),
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.005),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AllColor.yellowcolor,
                                  size: SizeConfig.screenheight*0.025,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AllColor.yellowcolor,
                                  size: SizeConfig.screenheight*0.025,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AllColor.yellowcolor,
                                  size: SizeConfig.screenheight*0.025,
                                ),
                                Icon(
                                  Icons.star,
                                  color:AllColor.yellowcolor,
                                  size: SizeConfig.screenheight*0.025,
                                ),
                                Icon(
                                  Icons.star,
                                  color: AllColor.yellowcolor,
                                  size: SizeConfig.screenheight*0.025,
                                ),
                              ],
                            ),
                             SizedBox(height: SizeConfig.screenheight*0.005),
                            Text(
                              "12 Followers",
                              style: TextStyle(
                                color: AllColor.whitecolor,
                              ),
                            ),
                            OutlineButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.thumb_up,
                                color:AllColor.whitecolor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.screenheight*0.04
                                ),
                              ),
                              color: AllColor.whitecolor,
                              borderSide: BorderSide(
                                width: 1,
                                color: AllColor.whitecolor,
                              ),
                              textColor:AllColor.whitecolor,
                              label: Text("Follow"),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                TabBar(
                  labelColor: Colors.black,
                  controller: _tabController,
                  labelStyle: TextStyle(fontSize: SizeConfig.screenheight*0.016),
                  tabs: [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "Top Selling",
                    ),
                    Tab(
                      text: "Products",
                    ),
                    Tab(
                      text: "Review",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeTab(),
            TopSellingTab(),
            ProductTab(),
            ReviewTab(),
          ],
        ),
      ),
    );
  }
}
