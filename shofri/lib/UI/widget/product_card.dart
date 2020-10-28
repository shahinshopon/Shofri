import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class ProductCard extends StatelessWidget {
  final double cardWidth;
  final String asset;
  final double assetHeight;
  final double assetWidth;
  final double price;
  final String productName;

  const ProductCard(
      {Key key,
      @required this.cardWidth,
      @required this.asset,
      @required this.assetHeight,
      @required this.assetWidth,
      @required this.price,
      @required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(SizeConfig.screenheight*0.005),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.01),
        ),
        elevation: 4,
        child: Container(
          width: cardWidth,
          padding: EdgeInsets.all(SizeConfig.screenheight*0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  asset,
                  height: assetHeight,
                  width: assetWidth,
                ),
              ),
              SizedBox(height: SizeConfig.screenheight*0.005),
              Text(
                "₹$price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AllColor.orangecolor,
                ),
              ),
               SizedBox(height:SizeConfig.screenheight*0.005),
              Text(productName),
              SizedBox(height: SizeConfig.screenheight*0.005),
              buildStar(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
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
        color: AllColor.yellowcolor,
        size: SizeConfig.screenheight*0.025,
      ),
      Icon(
        Icons.star,
        color:AllColor.yellowcolor,
        size: SizeConfig.screenheight*0.025,
      ),
    ],
  );
}
