import 'package:flutter/material.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ProfilePage/productdetailspage.dart';
import 'package:shofri/UI/widget/product_card.dart';

class TopSellingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        SizeConfig.screenheight*0.015
      ),
      child: GridView.count(
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
              asset: "assets/jacket.png",
              assetHeight: SizeConfig.screenheight*0.1,
              assetWidth: SizeConfig.screenwidth*0.25,
              price: 49.99,
              productName: "Grey Jacket",
            ),
          ),
        ),
      ),
    );
  }
}
