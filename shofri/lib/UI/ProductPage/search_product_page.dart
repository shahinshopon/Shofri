import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class SearchProductPage extends StatefulWidget {
  @override
  _SearchProductPageState createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  List<String> recommended = [
    "Denim Jeans",
    "Mini Skirt",
    "Jacket",
    "Accessories",
    "Sports Accessories",
    "Yoga Pants",
    "Eye Shadow"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
        backgroundColor:AllColor.whitecolor,
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: Container(
          padding: EdgeInsets.all(SizeConfig.screenheight*0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Something",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: SizeConfig.screenheight*0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "RECENTLY VIEWED",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Text(
                    "CLEAR",
                    style: Theme.of(context).textTheme.caption.apply(
                          color: AllColor.orangecolor,
                        ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.screenheight*0.01),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.satellite),
                        title: Text("Red Cotton Scarf"),
                        subtitle: Text("11.0"),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenwidth*0.02),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.satellite),
                        title: Text("Red Cotton Scarf"),
                        subtitle: Text("11.0"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenheight*0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "RECOMMENDED",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Text(
                    "REFRESH",
                    style: Theme.of(context).textTheme.caption.apply(
                          color:AllColor.orangecolor,
                        ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.screenheight*0.01),
              Wrap(
                children: recommended
                    .map(
                      (e) => Padding(
                        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenwidth*0.005),
                        child: ChoiceChip(
                          label: Text(e),
                          selected: false,
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
