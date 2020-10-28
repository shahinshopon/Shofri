import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class AddOfferPage extends StatefulWidget {
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  List<String> offer = [];
  final TextEditingController _txtOffer = TextEditingController();

  @override
  void initState() {
    offer = ["This Is Dummy", "This Is Dummy", "This Is Dummy"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color:AllColor.whitecolor,
          ),
          title: Text("Add Offer"),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: offer.length,
                  itemBuilder: (context, index) {
                    final data = offer[index];
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          offer.remove(data);
                        });
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: AllColor.redcolor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              color: AllColor.whitecolor,
                            ),
                             SizedBox(width: SizeConfig.screenwidth*0.02),
                            Text(
                              "Delete",
                              style: TextStyle(
                                  color: AllColor.whitecolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width:SizeConfig.screenwidth*0.04),
                          ],
                        ),
                      ),
                      child: ListTile(
                        title: Text(data),
                        subtitle: Text("Offer made on 11 July"),
                        leading: Icon(Icons.launch),
                      ),
                    );
                  },
                ),
                SizedBox(height: SizeConfig.screenheight*0.02),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenheight*0.04
                    ),
                  ),
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return _dialogOffer();
                      },
                    );

                    if (result != false && result != null) {
                      setState(() {
                        offer.add(result);
                      });
                    }
                  },
                  splashColor: AllColor.orangecolor,
                  child: Text(
                    "Add Offer",
                    style: TextStyle(
                      color: AllColor.ambercolor[700],
                      fontWeight: FontWeight.bold,
                      fontSize:SizeConfig.screenheight*0.022,
                    ),
                  ),
                  color:AllColor.rgbocolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogOffer() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.screenheight*0.02),
      ),
      title: Text("Add Offer"),
      content: TextFormField(
        controller: _txtOffer,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Offer",
          prefixIcon: Icon(
            Icons.satellite,
          ),
        ),
      ),
      actions: [
        FlatButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.screenheight*0.04
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
            _txtOffer.clear();
          },
          icon: Icon(
            Icons.launch,
            color: AllColor.whitecolor,
          ),
          label: Text("Cancel"),
          textColor: AllColor.whitecolor,
          color: AllColor.redcolor,
        ),
        FlatButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.screenheight*0.04
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(_txtOffer.text);
            _txtOffer.clear();
          },
          icon: Icon(
            Icons.add_circle_outline,
            color: AllColor.whitecolor,
          ),
          label: Text("Add"),
          textColor: AllColor.whitecolor,
          color: AllColor.greencolor,
        ),
      ],
    );
  }
}
