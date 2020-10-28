import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class MyProductPage extends StatefulWidget {
  @override
  _MyProductPageState createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  final List<String> dummyProduct = [
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White",
    "Summer White"
  ];

  List<bool> _isRecommend = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    dummyProduct.forEach((element) {
      _isRecommend.add(false);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    SharedPreferences.getInstance().then((value) {
      if (!value.containsKey("star-note")) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Tap the Star Icon to recommend your Product"),
          onVisible: () {
            SharedPreferences.getInstance().then((value) async {
              await value.setBool("star-note", true);
            });
          },
        ));
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("MY PRODUCTS"),
          leading: Icon(Icons.menu),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "/add-product"),
          backgroundColor: AllColor.orangecolor,
          child: Icon(
            Icons.add,
            size: SizeConfig.screenheight*0.04,
            color: AllColor.whitecolor,
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(SizeConfig.screenheight*0.02),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: SizeConfig.screenwidth*0.01,
              mainAxisSpacing: SizeConfig.screenwidth*0.01,
            ),
            itemCount: dummyProduct.length,
            itemBuilder: (context, index) {
              final item = dummyProduct[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.02),
                ),
                elevation: 4,
                child: GridTile(
                  child: Container(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         SizedBox(height: SizeConfig.screenheight*0.005),
                        Stack(
                          children: [
                            Container(
                              height: SizeConfig.screenheight*0.138,
                              width: SizeConfig.screenwidth*0.41,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.screenheight*0.01
                                  ),
                                ),
                                color: AllColor.lightbluecolor.shade300,
                              ),
                            ),
                            Positioned(
                              top: SizeConfig.screenheight*0.0125,
                              right: SizeConfig.screenwidth*0.075,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isRecommend[index] = !_isRecommend[index];
                                  });
                                },
                                child: _isRecommend[index]
                                    ? Icon(
                                        Icons.star,
                                        color:AllColor.orangecolor,
                                        size: SizeConfig.screenheight*0.035,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        color:AllColor.blackcolor,
                                        size: SizeConfig.screenheight*0.035,
                                      ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: SizeConfig.screenwidth*0.02),
                            Text(item),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox(width: SizeConfig.screenwidth*0.02),
                            Text(
                              "68 sold",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                            Expanded(
                              child: Text(
                                "₹39.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: SizeConfig.screenwidth*0.105,
                              height: SizeConfig.screenheight*0.025,
                              decoration: BoxDecoration(
                                color: AllColor.greencolor,
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.screenheight*0.04
                                ),
                              ),
                              child: Row(
                                children: [
                                   SizedBox(width: SizeConfig.screenwidth*0.015),
                                  Text(
                                    "3.2",
                                    style: TextStyle(
                                        color: AllColor.whitecolor, 
                                        fontSize: SizeConfig.screenheight*0.012),
                                  ),
                                   SizedBox(width: SizeConfig.screenheight*0.004),
                                  Icon(
                                    Icons.star,
                                    color: AllColor.whitecolor,
                                    size: SizeConfig.screenheight*0.015,
                                  ),
                                  // SizedBox(width: SizeConfig.screenheight*0.015),
                                ],
                              ),
                            ),
                           SizedBox(width: SizeConfig.screenwidth*0.02),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
