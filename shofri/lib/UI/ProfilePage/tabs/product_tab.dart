import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/productdetailspage.dart';
import 'package:shofri/UI/widget/product_card.dart';


class ProductTab extends StatefulWidget {
  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab>with SingleTickerProviderStateMixin {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _hideButtonController;
  bool _isVisible = true;

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
    
  }

  @override
  void dispose() {
    _hideButtonController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(

        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _isVisible?
             Center(
               child: Container(
                 
                 height: SizeConfig.screenheight*0.06,
                 width: SizeConfig.screenwidth*0.55,
                 decoration: BoxDecoration(
                   color: AllColor.whitecolor,
                   border: Border.all(
                     width: 1,
                     color: AllColor.blackcolor
                   ),
                   borderRadius: BorderRadius.all(
                     Radius.circular(SizeConfig.screenheight*0.02)
                   )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Icon(
                           Icons.sort,
                           color: AllColor.blackcolor,
                           size: SizeConfig.screenheight * 0.03,
                         ),
                         Text("Sort",style:TextStyle(
                           fontSize: SizeConfig.screenheight*0.015
                         ))
                       ],
                     ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Icon(
                           Icons.filter,
                           color: AllColor.blackcolor,
                           size: SizeConfig.screenheight * 0.03,
                         ),
                         Text("Filter",style:TextStyle(
                           fontSize: SizeConfig.screenheight*0.015
                         ))
                       ],
                     ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Icon(
                           Icons.location_on,
                           color: AllColor.blackcolor,
                           size: SizeConfig.screenheight * 0.03,
                         ),
                         Text("Near me",style:TextStyle(
                           fontSize: SizeConfig.screenheight*0.015
                         ))
                       ],
                     ),
                   ],
                 ),
               ),
             ):null,
            body: 
              Container(
            padding:  EdgeInsets.all(
              SizeConfig.screenheight*0.01
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Products", style: Theme.of(context).textTheme.headline6),
                 SizedBox(height:SizeConfig.screenheight*0.02),
                Expanded(
                  child: GridView.count(
                    controller: _hideButtonController,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    children: List.generate(
                      8,
                      (index) => GestureDetector(
                        onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                      },
                            child: ProductCard(
                          cardWidth: SizeConfig.screenwidth*0.5,
                          asset: "assets/backpack.png",
                          assetHeight: SizeConfig.screenheight*0.1,
                          assetWidth: SizeConfig.screenwidth*0.25,
                          price: 49.99,
                          productName: "Blue Backpack",
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
