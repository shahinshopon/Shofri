import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ChatPage/chatpagetab.dart';
import 'package:shofri/UI/ChatPage/chatpage.dart';
import 'package:shofri/UI/ProfilePage/seller_profile_page.dart';
import 'package:shofri/UI/WelcomePage/welcome_page.dart';
import 'package:shofri/UI/widget/fab_bottom_item.dart';
import 'package:shofri/UI/widget/search_location.dart';
import 'package:shofri/models/slider.dart';
import 'package:shofri/provider/slider_provider.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
 
  
  final Address location;

  HomePage({Key key, this.location}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _hideButtonController;
  bool _isVisible = true;
  TabController _tabController;
  Address get location => widget.location;
  String _currentAddres = "";
  Location locationService = new Location();

  bool _serviceEnabled;

  _enableService() async {
    final sp = await SharedPreferences.getInstance();
    _serviceEnabled = await locationService.serviceEnabled();
    sp.setBool("gpsEnabled", _serviceEnabled);
    bool service = sp.getBool("gpsEnabled");
    if (!service) {
      service = await locationService.requestService();
      await sp.setBool("gpsEnabled", service);
      if (!service) {
        return;
      }
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    _enableService();
    if (location != null) {
      List<String> newAddress = location.addressLine.split(", ");
      _currentAddres = "${newAddress[0]}, ${newAddress[1]}, ${newAddress[2]}";
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _hideButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
     floatingActionButtonLocation:_isVisible? FloatingActionButtonLocation.centerDocked:
     FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AllColor.orangecolor,
        elevation: 0,
        child: Image.asset("assets/scanner.png",
        color: AllColor.whitecolor,
          width: SizeConfig.screenheight * 0.047,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/scan");
        },
      ),
      
         
      bottomNavigationBar: _buildBottomNavigationBar(),
      drawer: Drawer(),
      body: TabBarView(
        //physics: ScrollPhysics.,
        controller: _tabController,
        children: [
          _buildHomeBody(),
          ChatPage(),
          WelcomePage(),
          SellerProfilePage(
            controller: _hideButtonController,
          ),
        ],
      ),
    );
  }

  Widget _buildHomeBody() {
    return SafeArea(
          child: CustomScrollView(
        controller: _hideButtonController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenheight * 0.02),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    right: true,
                    top: false,
                    left: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await showMaterialModalBottomSheet(
                                context: context,
                                expand: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        SizeConfig.screenheight * 0.02),
                                    topRight: Radius.circular(
                                        SizeConfig.screenheight * 0.02),
                                  ),
                                ),
                                builder: (context, scrollController) =>
                                    SearchLocation(),
                              );
                            },
                            child: Row(
                              children: [
                                SizedBox(width: SizeConfig.screenwidth * 0.02),
                                Icon(
                                  Icons.location_on,
                                  size: SizeConfig.screenheight * 0.04,
                                ),
                                SizedBox(width: SizeConfig.screenwidth * 0.02),
                                Expanded(
                                  child: Text(
                                    location == null
                                        ? "Search Location"
                                        : "$_currentAddres",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: SizeConfig.screenwidth * 0.02),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Badge(
                              badgeContent: Text(
                                '5',
                                style: TextStyle(color: AllColor.whitecolor),
                              ),
                              badgeColor: AllColor.orangecolor,
                              position: BadgePosition.bottomEnd(
                               //
                                end: 10
                              ),
                              child: Icon(Icons.notifications_active,
                                  size: SizeConfig.screenheight * 0.035),
                            ),
                            SizedBox(width: SizeConfig.screenwidth * 0.04),
                            InkWell(
                              onTap: () {
                                Toast.show(
                                  "Please login for checking cart",
                                  context,
                                  gravity: Toast.BOTTOM,
                                  backgroundColor: AllColor.lightbluecolor,
                                  textColor: AllColor.whitecolor,
                                  duration: 4,
                                );
                                _tabController.animateTo(3);
                              },
                              child: Badge(
                                badgeContent: Text(
                                  '5',
                                  style: TextStyle(color: AllColor.whitecolor),
                                ),
                                badgeColor: AllColor.orangecolor,
                                position: BadgePosition.bottomEnd(
                               //
                                end: 10
                              ),
                                child: Icon(Icons.shopping_cart,
                                    size: SizeConfig.screenheight * 0.035),
                              ),
                            ),
                            SizedBox(width: SizeConfig.screenwidth * 0.02),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenheight * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: AllColor.greycolor.shade300,
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenheight * 0.01),
                  SafeArea(
                    right: true,
                    top: false,
                    left: true,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: SizeConfig.screenwidth * 0.02),
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () =>
                                    _scaffoldKey.currentState.openDrawer(),
                                child: Icon(
                                  Icons.menu,
                                  color: AllColor.orangecolor,
                                  size: SizeConfig.screenheight * 0.04,
                                ),
                              ),
                              SizedBox(width: SizeConfig.screenwidth * 0.02),
                              Expanded(
                                child: TextFormField(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/search-product");
                                    FocusScope.of(context).unfocus();
                                  },
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenwidth * 0.08),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Search the product",
                                    suffixIcon: Icon(
                                      Icons.search,
                                    ),
                                    filled: true,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenwidth * 0.02),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenheight * 0.01),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: SizeConfig.screenheight * 0.25,
                        maxWidth: SizeConfig.screenwidth,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          HomepageImageHeader(),
                          SizedBox(width: SizeConfig.screenwidth * 0.02),
                          HomepageImageHeader(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenwidth * 0.03,
                        vertical: SizeConfig.screenheight * 0.01),
                    child: Text(
                      "Categories",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenwidth * 0.03,
                          vertical: SizeConfig.screenheight * 0.01),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomepageColorContainer(
                              color: AllColor.ambercolor,
                            ),
                            SizedBox(
                              width: SizeConfig.screenwidth * 0.03,
                            ),
                            HomepageColorContainer(
                              color: AllColor.greencolor,
                            ),
                            SizedBox(
                              width: SizeConfig.screenwidth * 0.03,
                            ),
                            HomepageColorContainer(color: AllColor.greycolor),
                            SizedBox(
                              width: SizeConfig.screenwidth * 0.03,
                            ),
                            HomepageColorContainer(
                              color: AllColor.orangecolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.screenheight * 0.01,
                        bottom: SizeConfig.screenheight * 0.01),
                    child: Center(
                      child: Container(
                        height: SizeConfig.screenheight * 0.035,
                        width: SizeConfig.screenwidth * 0.22,
                        decoration: BoxDecoration(
                            gradient: SweepGradient(
                                colors: [Color(0xffF8991D), Color(0xffFA5C7C)]),
                            borderRadius: BorderRadius.all(Radius.circular(
                                SizeConfig.screenheight * 0.02))),
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                fontSize: SizeConfig.screenheight * 0.015,
                                color: AllColor.whitecolor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenheight * 0.005,
                  ),
                  Flexible(
                        child: Padding(
                          padding:  EdgeInsets.only(
                          left:  SizeConfig.screenwidth*0.02
                          ),
                          child: Container(
                            //0.25
                      height: SizeConfig.screenheight * 0.28,
                      color: Color(0xffF76A8C),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenwidth * 0.013,
                            top: SizeConfig.screenheight * 0.007,
                            bottom: SizeConfig.screenheight * 0.007,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  Text(
                                    "Today's Deal",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.screenheight * 0.025,
                                        color: AllColor.whitecolor),
                                  ),
                                  Text(
                                    "See All",
                                    style: TextStyle(
                                        fontSize: SizeConfig.screenheight * 0.015,
                                        color: AllColor.whitecolor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenheight * 0.01,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    HomepageReuseableCard(
                                      image: "assets/womenshoe.png",
                                      name: "Ankle Boots",
                                      price: "₹49.99",
                                    ),
                                    HomepageReuseableCard(
                                      image: "assets/scarf.png",
                                      name: "Red Scarf",
                                      price: "₹11.00",
                                    ),
                                    HomepageReuseableCard(
                                      image: "assets/womenshoe.png",
                                      name: "Ankle Boots",
                                      price: "₹49.99",
                                    ),
                                    HomepageReuseableCard(
                                      image: "assets/scarf.png",
                                      name: "Red Scarf",
                                      price: "₹11.00",
                                    ),
                                    HomepageReuseableCard(
                                      image: "assets/womenshoe.png",
                                      name: "Ankle Boots",
                                      price: "₹49.99",
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                      ),
                    ),
                        ),
                  ),
                  Flexible(
                       child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                      padding:  EdgeInsets.only(
                        left:  SizeConfig.screenwidth*0.02
                      ),
                      child: Container(
                        height: SizeConfig.screenheight * 0.17,
                        color: Color(0xffE3DADA),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: SizeConfig.screenwidth * 0.1),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Swipe",
                                    style: TextStyle(
                                        fontSize: SizeConfig.screenheight * 0.02,
                                        color: AllColor.whitecolor)),
                                SizedBox(
                                  height: SizeConfig.screenheight * 0.003,
                                ),
                                Container(
                                  height: SizeConfig.screenheight * 0.02,
                                  width: SizeConfig.screenwidth * 0.09,
                                  decoration: BoxDecoration(
                                    color: AllColor.whitecolor,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.screenwidth * 0.025),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.arrow_back,
                                    color: AllColor.orangecolor,
                                    size: SizeConfig.screenheight * 0.02,
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(width: SizeConfig.screenwidth * 0.05),
                            HomepageSwipeContainer(
                              number: "399",
                            ),
                            SizedBox(width: SizeConfig.screenwidth * 0.03),
                            HomepageSwipeContainer(
                              number: "699",
                            ),
                            SizedBox(width: SizeConfig.screenwidth * 0.03),
                            HomepageSwipeContainer(
                              number: "999",
                            ),
                            SizedBox(width: SizeConfig.screenwidth * 0.03),
                            HomepageSwipeContainer(
                              number: "1299",
                            ),
                          ],
                        ),
                      ),
                        ),
                    ),
                  ),
                  Flexible(
                      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: EdgeInsets.only(
                       top: SizeConfig.screenheight * 0.01,
                       bottom: SizeConfig.screenheight * 0.01,
                       left: SizeConfig.screenwidth * 0.02,
                          ),
                          child: Row(
                       children: [
                         HomepageImageContainer(
                           imagename: "assets/image8.png",
                         ),
                         SizedBox(
                           width: SizeConfig.screenwidth * 0.02,
                         ),
                         HomepageImageContainer(
                           imagename: "assets/image8.png",
                         ),
                       ],
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.screenheight * 0.017,
                        left: SizeConfig.screenwidth * 0.02,
                        bottom: SizeConfig.screenheight * 0.015),
                    child: Text("Featured Products",
                        style: TextStyle(
                            fontSize: SizeConfig.screenheight * 0.025,
                            fontWeight: FontWeight.bold,
                            color: AllColor.blackcolor)),
                  ),
                  Flexible(
                      child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: SizeConfig.screenheight * 0.27,
                        color: AllColor.whitecolor,
                        child: Row(
                          children: [
                            HomepageFeaturedProduct(
                                image: "assets/women.png",
                                color: Color(0xffF8F364)),
                            HomepageFeaturedProduct(
                              image: "assets/women.png",
                              color: Color(0xffDC4BF8),
                            ),
                            HomepageFeaturedProduct(
                                image: "assets/women.png",
                                color: Color(0xffF8F364)),
                            HomepageFeaturedProduct(
                                image: "assets/women.png",
                                color: Color(0xffDC4BF8)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: Container(
                     height: SizeConfig.screenheight*0.26,
                     decoration: BoxDecoration(
                       gradient: LinearGradient(colors: [
                         Color(0xff6EBFB5),
                         Color(0xff8675A9),
                         
                       ],
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter
                       
                       )
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Center(
                           child: Text("Best Seller",style:TextStyle(
                             fontSize: SizeConfig.screenheight*0.027,
                             fontWeight: FontWeight.bold,
                             color: AllColor.whitecolor
                           )),
                         ),
                         SizedBox(height: SizeConfig.screenheight*0.005,),
                         SingleChildScrollView(
                           scrollDirection: Axis.horizontal,
                              child: Row(
                             children: [
                               SizedBox(width: SizeConfig.screenwidth*0.042,),
                               HomepageBestSeller(),
                               SizedBox(width: SizeConfig.screenwidth*0.037,),
                                HomepageBestSeller(),
                                SizedBox(width: SizeConfig.screenwidth*0.037,),
                                HomepageBestSeller(),
                                SizedBox(width: SizeConfig.screenwidth*0.037,),
                                  HomepageBestSeller(),
                                  SizedBox(width: SizeConfig.screenwidth*0.037,),
                                   HomepageBestSeller(),
                             ],
                           ),
                         )
                       ],
                     ),
                    ),
                  ),
              
                  Flexible(
                       child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenwidth*0.06,
                        top: SizeConfig.screenheight*0.025,
                        bottom: SizeConfig.screenheight*0.025
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shop by Brands",style:TextStyle(
                                   fontSize: SizeConfig.screenheight*0.027,
                                   fontWeight: FontWeight.bold,
                                   color: AllColor.blackcolor
                                 )),

                              SizedBox(height: SizeConfig.screenheight*0.02,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                child: Row(
                              children: [
                                HomepageShopByBrands(),
                                SizedBox(width: SizeConfig.screenwidth*0.02,),
                                HomepageShopByBrands(),
                                SizedBox(width: SizeConfig.screenwidth*0.02,),
                                HomepageShopByBrands(),
                                SizedBox(width: SizeConfig.screenwidth*0.02,),
                                HomepageShopByBrands(),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight*0.02,),
                          Text("Best Selling Product",style:TextStyle(
                                   fontSize: SizeConfig.screenheight*0.027,
                                   fontWeight: FontWeight.bold,
                                   color: AllColor.blackcolor
                                 )),
                          SizedBox(height: SizeConfig.screenheight*0.02,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                                child: Row(
                              children: [
                                HomepageBestSellingProduct(
                                  image: "assets/women.png",
                                color: Color(0xffF8F364)
                                ),
                                HomepageBestSellingProduct(
                                  image: "assets/women.png",
                                color: Color(0xffDC4BF8),
                                ),
                                HomepageBestSellingProduct(
                                  image: "assets/women.png",
                                color: Color(0xffF8F364)
                                ),
                                HomepageBestSellingProduct(
                                  image: "assets/women.png",
                                color: Color(0xffDC4BF8),
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
          //
          /*
           Selector<CategoryProvider, List<Category>>(
                        builder: (context, value, child) {
                         return SliverGrid(
                           delegate: SliverChildBuilderDelegate(
                            (context, index) {
                               final data = value[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                               child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                     CircleAvatar(
                                       radius: 32,
                                       backgroundImage: NetworkImage(
                                          "https://www.shofri.in/public/${data.banner}",
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Expanded(
                                        child: Container(
                                         width: 64,
                     
                                          child: Text(data.name),
                                       ),
                                     ),
                                    ],
                                  ),
                                );
                             },
                              childCount: value.length,
                            ),
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 4),
                          );
                       },
                        selector: (_, provider) => provider.category,
                      ),*/
          //
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: _isVisible ? SizeConfig.screenheight * 0.075 : 0.0,
      child: FABBottomAppBar(
        onTabSelected: (value) {
          if (value == 2) {
            _tabController.animateTo(3);
            value = 3;
            Toast.show(
              "Please login for checking Wishlist",
              context,
              gravity: Toast.BOTTOM,
              backgroundColor: AllColor.lightbluecolor,
              textColor: AllColor.whitecolor,
              duration: 4,
            );
          } else {
            _tabController.animateTo(value);
          }
        },
        notchedShape: CircularNotchedRectangle(),
        color: AllColor.bluegreycolor,
        selectedColor: AllColor.orangecolor,
        items: [
          FABBottomAppBarItem(
            iconData: Icons.home,
            text: 'Home',
          ),
          FABBottomAppBarItem(
            iconData: Icons.message,
            text: 'Chat',
          ),
          
          FABBottomAppBarItem(
            iconData: Icons.favorite_border,
            text: 'Wishlist',
          ),
          FABBottomAppBarItem(
            iconData: Icons.people_outline,
            text: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildImageHeader() {
    return Selector<SliderProvider, List<SliderModel>>(
      selector: (_, provider) => provider.slider,
      builder: (context, value, child) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Image.network(
                    "https://www.shofri.in/public/${value.first.photo}",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenheight * 0.02,
                      horizontal: SizeConfig.screenwidth * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For all your",
                          style: TextStyle(
                            color: AllColor.whitecolor,
                            fontSize: SizeConfig.screenheight * 0.027,
                          ),
                        ),
                        Text(
                          "summer clothing",
                          style: TextStyle(
                            color: AllColor.whitecolor,
                            fontSize: SizeConfig.screenheight * 0.027,
                          ),
                        ),
                        Text(
                          "needs",
                          style: TextStyle(
                            color: AllColor.whitecolor,
                            fontSize: SizeConfig.screenheight * 0.027,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.02),
                        InkWell(
                          onTap: () {
                            print("Clicked");
                          },
                          splashColor: AllColor.orangecolor,
                          highlightColor: AllColor.orangecolor,
                          child: Container(
                            width: SizeConfig.screenwidth * 0.39,
                            height: SizeConfig.screenheight * 0.057,
                            decoration: BoxDecoration(
                              color: AllColor.whitecolor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.screenheight * 0.04),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SEE MORE",
                                  style: TextStyle(
                                    fontSize: SizeConfig.screenheight * 0.023,
                                    color: AllColor.greycolor,
                                  ),
                                ),
                                SizedBox(width: SizeConfig.screenwidth * 0.02),
                                ClipOval(
                                  child: Container(
                                    width: SizeConfig.screenwidth * 0.08,
                                    height: SizeConfig.screenheight * 0.04,
                                    color: AllColor.orangecolor,
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: AllColor.whitecolor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomepageShopByBrands extends StatelessWidget {
  const HomepageShopByBrands({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight*0.15,
      width: SizeConfig.screenwidth*0.32,
      decoration: BoxDecoration(
        
              color: Color(0xffF8991D),
              borderRadius: BorderRadius.circular(
                  SizeConfig.screenwidth * 0.025),
            ),

            child: Center(child: Image.asset("assets/chanel.png",fit: BoxFit.fitWidth,)),
    );
  }
}

class HomepageBestSeller extends StatelessWidget {
  const HomepageBestSeller({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight*0.165,
      width: SizeConfig.screenwidth*0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: SizeConfig.screenheight*0.05,
            backgroundColor: AllColor.whitecolor,
          ),
          Text("Young Fashion",style:TextStyle(
        fontSize: SizeConfig.screenheight*0.015,
        
        color: AllColor.whitecolor
      )),
      Row(
        children: [
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star_border,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),

        ],
      )
        ],
      ),
    );
  }
}

class HomepageFeaturedProduct extends StatelessWidget {
  HomepageFeaturedProduct({this.image, this.color});
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.screenwidth * 0.02,
          right: SizeConfig.screenwidth * 0.02,
          bottom: SizeConfig.screenheight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenheight * 0.17,
            width: SizeConfig.screenwidth * 0.42,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenwidth * 0.032),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Text("Summer White",
              style: TextStyle(
                  fontSize: SizeConfig.screenheight * 0.023,
                  color: AllColor.blackcolor)),
          Container(
            height: SizeConfig.screenheight * 0.03,
            width: SizeConfig.screenwidth * 0.14,
            decoration: BoxDecoration(
              color: AllColor.greencolor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenwidth * 0.02),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "4.2",
                  style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.017,
                      color: AllColor.whitecolor),
                ),
                Icon(
                  Icons.star,
                  size: SizeConfig.screenheight * 0.018,
                  color: AllColor.whitecolor,
                )
              ],
            ),
          ),
          Text("₹39.00",
              style: TextStyle(
                  fontSize: SizeConfig.screenheight * 0.025,
                  color: AllColor.blackcolor))
        ],
      ),
    );
  }
}

class HomepageBestSellingProduct extends StatelessWidget {
  HomepageBestSellingProduct({this.image, this.color});
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.screenwidth * 0.02,
          right: SizeConfig.screenwidth * 0.02,
          bottom: SizeConfig.screenheight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.screenheight * 0.17,
            width: SizeConfig.screenwidth * 0.42,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenwidth * 0.032),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Text("Summer White",
              style: TextStyle(
                  fontSize: SizeConfig.screenheight * 0.023,
                  color: AllColor.blackcolor)),
          Container(
            height: SizeConfig.screenheight * 0.03,
            width: SizeConfig.screenwidth * 0.14,
            decoration: BoxDecoration(
              color: AllColor.greencolor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenwidth * 0.02),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "4.2",
                  style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.017,
                      color: AllColor.whitecolor),
                ),
                Icon(
                  Icons.star,
                  size: SizeConfig.screenheight * 0.018,
                  color: AllColor.whitecolor,
                )
              ],
            ),
          ),
          Text("₹39.00",
              style: TextStyle(
                  fontSize: SizeConfig.screenheight * 0.025,
                  color: AllColor.blackcolor))
        ],
      ),
    );
  }
}

class HomepageImageContainer extends StatelessWidget {
  HomepageImageContainer({this.imagename});
  final String imagename;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight * 0.23,
      width: SizeConfig.screenwidth * 0.8,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConfig.screenwidth * 0.03))),
      child: Image.asset(
        imagename,
        fit: BoxFit.fill,
      ),
    );
  }
}

class HomepageSwipeContainer extends StatelessWidget {
  HomepageSwipeContainer({this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight * 0.1,
      width: SizeConfig.screenwidth * 0.28,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AllColor.whitecolor),
        color: Color(0xffF8991D),
        borderRadius: BorderRadius.circular(SizeConfig.screenwidth * 0.025),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Under",
            style: TextStyle(
                fontSize: SizeConfig.screenheight * 0.015,
                color: AllColor.whitecolor,
                fontWeight: FontWeight.w500),
          ),
          Text(
            number,
            style: TextStyle(
                fontSize: SizeConfig.screenheight * 0.04,
                color: AllColor.whitecolor,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class HomepageReuseableCard extends StatelessWidget {
  HomepageReuseableCard({this.image, this.name, this.price});
  final String image;
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.screenheight * 0.015))),
      child: Container(
        height: SizeConfig.screenheight * 0.21,
        width: SizeConfig.screenwidth * 0.26,
        decoration: BoxDecoration(
            color: AllColor.whitecolor,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.screenheight * 0.015))),
        child: Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenwidth * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image,
             
              width: SizeConfig.screenheight*0.14,
              fit: BoxFit.fitHeight,),
              Text(
                name,
                style: TextStyle(
                    fontSize: SizeConfig.screenheight * 0.02,
                    color: Color(0xff515C6F)),
              ),
              Text(price,
                  style: TextStyle(
                      fontSize: SizeConfig.screenheight * 0.018,
                      color: Color(0xffF8991D))),
              Row(
        children: [
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),
          Icon(Icons.star_border,color: AllColor.yellowcolor,size: SizeConfig.screenheight*0.02,),

        ],
      )
            ],
          ),
        ),
      ),
    );
  }
}

class HomepageColorContainer extends StatelessWidget {
  HomepageColorContainer({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenheight * 0.11,
      width: SizeConfig.screenwidth * 0.22,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.screenheight * 0.02))),
    );
  }
}


class HomepageImageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image.asset(
          "assets/summer-wallpaper.png",
          width: SizeConfig.screenwidth,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical:SizeConfig.screenheight*0.02,
            horizontal: SizeConfig.screenwidth*0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "For all your",
                style: TextStyle(
                  color:AllColor.whitecolor,
                  fontSize: SizeConfig.screenheight*0.027,
                ),
              ),
              Text(
                "summer clothing",
                style: TextStyle(
                  color: AllColor.whitecolor,
                  fontSize: SizeConfig.screenheight*0.027,
                ),
              ),
              Text(
                "needs",
                style: TextStyle(
                  color:AllColor.whitecolor,
                  fontSize: SizeConfig.screenheight*0.027,
                ),
              ),
               SizedBox(height: SizeConfig.screenheight*0.02),
              InkWell(
                onTap: () {
                  print("Clicked");
                },
                splashColor: AllColor.orangecolor,
                highlightColor: AllColor.orangecolor,
                child: Container(
                  width: SizeConfig.screenwidth*0.39,
                  height: SizeConfig.screenheight*0.058,
                  decoration: BoxDecoration(
                    color: AllColor.whitecolor,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenheight*0.04
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SEE MORE",
                        style: TextStyle(
                          fontSize: SizeConfig.screenheight*0.022,
                          color:AllColor.greycolor,
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenwidth*0.02),
                      ClipOval(
                        child: Container(
                          width: SizeConfig.screenwidth*0.08,
                          height: SizeConfig.screenheight*0.04,
                          color: AllColor.orangecolor,
                          child: Icon(
                            Icons.navigate_next,
                            color:AllColor.whitecolor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


class Category {}
