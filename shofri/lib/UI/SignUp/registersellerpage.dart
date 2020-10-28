import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/LogIn/loginpage.dart';
import 'package:shofri/UI/SignUp/verificationpage.dart';

class RegisterSellerPage extends StatefulWidget {
  @override
  _RegisterSellerPageState createState() => _RegisterSellerPageState();
}

class _RegisterSellerPageState extends State<RegisterSellerPage> {

  //
  var shopname;
  var phone;
  var name;
  var address;
  var confirmpassword;
  

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // global key
  final _key = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  // registration function
  registerseller (String name,phone,email,password)async{
    final User user = (await
    _auth.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    )
    ).user;
    if (user != null) {
       db.collection("users").add({
         'shopname':shopname,
         'address':address,
         'phone':phone,
         'name':name,
         'email':_email.text,
         'password':_password.text,
         'confirmpassword':confirmpassword,
         'UID':user.uid,
       });
       Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationPage(),),);
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.green));
    super.initState();
  }

  //
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  bool _value = false;
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false,
          child: GestureDetector(
        onTap: () {
          if (FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: AllColor.whitecolor,
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                         height: SizeConfig.screenheight * 0.4,
                         decoration: new BoxDecoration(
                          shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.1),
          blurRadius: 2.0, // has the effect of softening the shadow
          spreadRadius: 50.0, // has the effect of extending the shadow
          offset: Offset(
            -62.0, // horizontal, move right 10
            -10.0, // vertical, move down 10
          ),
        )
      ],
  ),
                        child: Image.asset("assets/circle.png")),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenwidth * 0.08,
                          vertical: SizeConfig.screenheight * 0.1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You Made",
                              style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.04,
                                  color: AllColor.whitecolor),
                            ),
                            Text(
                              "a Perfect ",
                              style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.044,
                                  color: AllColor.whitecolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Choice!",
                              style: TextStyle(
                                  fontSize: SizeConfig.screenheight * 0.044,
                                  color: AllColor.whitecolor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenheight * 0.0065),
                  Form(
                    key: _key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenheight * 0.007,
                        horizontal: SizeConfig.screenheight * 0.028,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Basic Shop Info",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.008),
                          TextFormField(
                            //
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Shop Name";
                              }
                            },
                            onChanged: (val){
                              setState(() {
                               shopname=val;
                              });
                            },
                            //
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Shop Name",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.008),
                          TextFormField(
                             keyboardType: TextInputType.text,
                            validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Address";
                              }
                            },
                            onChanged: (val){
                              setState(() {
                               address=val;
                              });
                            },
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Address",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.008),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            //
                            validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Phone Number";
                              }
                            },
                            onChanged: (val){
                              setState(() {
                                phone=val;
                              });
                            },
                            //
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Phone Number",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.01),
                          Text(
                            "Upload Shop Foto",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.007),
                          InkWell(
                            onTap: _image == null ? () => getImage() : null,
                            child: Container(
                              width: SizeConfig.screenwidth * 0.27,
                              height: SizeConfig.screenheight * 0.095,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.screenheight * 0.012),
                                ),
                                child: Center(
                                  child: _image == null
                                      ? Icon(Icons.add_a_photo)
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.screenheight * 0.012),
                                          child: Image.file(_image,
                                              fit: BoxFit.fill)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.012),
                          Text(
                            "User Info",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.009),
                          TextFormField(
                             keyboardType: TextInputType.text,
                            validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Name";
                              }
                            },
                            onChanged: (val){
                              setState(() {
                               name=val;
                              });
                            },
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Name",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.009),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            //
                            validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Email";
                              }
                            },
                            controller: _email,
                            //
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Email",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.009),
                          TextFormField(
                            obscureText: true,
                            //
                            validator: (value){
                              if(value.length<6){
                                return "Passwod atlest 6 digit";
                              }
                            },
                            controller: _password,
                            //
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.009),
                          TextFormField(
                            obscureText: true,
                            
                            validator: (value){
                              if(value.length<6){
                                return "Passwod atlest 6 digit";
                              }
                            },
                            controller: _password,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.screenwidth*0.06)
                              )
                            ),
                              labelText: "Confirm Password",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.009),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _value,
                                      onChanged: (bool val) {
                                        setState(() {
                                          _value = val;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                        width: SizeConfig.screenheight * 0.0045),
                                    Text(
                                      "I accept policy and terms",
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.009),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: SizeConfig.screenwidth * 0.35,
                                  height: SizeConfig.screenheight * 0.05,
                                  decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(
                               SizeConfig.screenheight*0.03
                             ),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.4),
          blurRadius: 2.0, // has the effect of softening the shadow
          spreadRadius: 2.0, // has the effect of extending the shadow
          offset: Offset(
            0.0, // horizontal, move right 10
            5.0, // vertical, move down 10
          ),
        )
      ],
  ),
                                child: MaterialButton(
                                  minWidth: SizeConfig.screenwidth * 0.35,
                                  height: SizeConfig.screenheight * 0.05,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.screenheight * 0.03),
                                  ),
                                  onPressed: () {
                                    if(_key.currentState.validate()){
                              registerseller(shopname, phone, _email, _password);
                               Navigator.of(context).pushNamed("/verification");
                            }
                                   
                                  },
                                  color: AllColor.orangecolor,
                                  child: Text(
                                    "Sign Up",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .apply(color: AllColor.whitecolor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.016),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Already have an Account ?",
                                    style: TextStyle(
                                      color: AllColor.blackcolor,
                                      fontSize: SizeConfig.screenheight * 0.016,
                                    ),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.of(context)
                                          .pushNamed("/login"),
                                    text: " Login",
                                    style: TextStyle(
                                      color: AllColor.orangecolor,
                                      fontSize: SizeConfig.screenheight * 0.025,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.screenheight * 0.018),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
