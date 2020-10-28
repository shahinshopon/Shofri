import 'package:flutter/material.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/productdetailspage.dart';
import 'package:shofri/UI/ProfilePage/tabs/image_header_dummy.dart';
import 'package:shofri/UI/widget/product_card.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        SizeConfig.screenheight*0.015
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: SizeConfig.screenheight*0.25,
                  maxWidth: SizeConfig.screenwidth,
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ImageHeaderDummy(),
                    SizedBox(width: SizeConfig.screenwidth*0.02),
                    ImageHeaderDummy(),
                  ],
                ),
              ),
            ),
            Text(
              "Recommended By Seller",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: SizeConfig.screenheight*0.01),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: SizeConfig.screenheight*0.25,
                  maxWidth: SizeConfig.screenwidth,
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    4,
                    (index) => Wrap(
                         children:[
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                              },
                           child: ProductCard(
                        cardWidth: SizeConfig.screenwidth*0.4,
                        asset: "assets/dress.png",
                        assetHeight:SizeConfig.screenheight*0.1,
                        assetWidth: SizeConfig.screenwidth*0.25,
                        price: 49.99,
                        productName: "Floral Grey Full Dress",
                      ),
                            ),],
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(height: SizeConfig.screenheight*0.01),
            Text(
              "New Arrival",
              style: Theme.of(context).textTheme.headline6,
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: SizeConfig.screenheight,
                  maxWidth: SizeConfig.screenwidth,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    6,
                    (index) => GestureDetector(

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                      },
                                          child: ProductCard(
                        cardWidth:SizeConfig.screenwidth*0.4,
                        asset: "assets/dress.png",
                        assetHeight: SizeConfig.screenheight*0.1,
                        assetWidth: SizeConfig.screenwidth*0.25,
                        price: 49.99,
                        productName: "Floral Grey Full Dress",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
