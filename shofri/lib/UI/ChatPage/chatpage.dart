import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/ChatPage/chatpagetab.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
          child: SafeArea(
                      child: Scaffold(
        body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AllColor.orangecolor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Message",
                    style: TextStyle(
                        fontSize: SizeConfig.screenheight * 0.025,
                        color: AllColor.blackcolor),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.screenwidth * 0.03,
                    right: SizeConfig.screenwidth * 0.03),
                child: TextFormField(
                  onTap: () {},
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.screenwidth * 0.08),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search Conversation",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    filled: true,
                  ),
                ),
              ),
              
              Expanded(
                            child: Container(
                   // height: SizeConfig.screenheight*0.69,
                    child: ChatPage1()),
              )
                
                
            ],
        ),
      ),
          ),
    );
  }
}
