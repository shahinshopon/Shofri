import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/Homepage/homepage.dart';
import 'package:shofri/UI/LogIn/userlogin.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  LoginPage({this.user});
  User user;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ////////////////
  final _key = GlobalKey<FormState>();
  var email;
  var password;
  

 login()async{
    FirebaseAuth firebaseAuth=FirebaseAuth.instance;
   final User user= (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
   if(user!=null){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
   }
  }
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //////////////
 bool _value=false;
  @override
  Widget build(BuildContext context) {
   // final providerdata = Provider.of<UserLogin>(context);
    return WillPopScope(
      onWillPop: ()async=>false,
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
                         
                            height: SizeConfig.screenheight * 0.4 ,
                            child: Image.asset(
                         "assets/circle.png",
                         
                         height: SizeConfig.screenheight * 0.4,
                            ),
                          ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:SizeConfig.screenwidth * 0.08,
                          vertical:SizeConfig.screenheight * 0.1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome,",
                              style: TextStyle(fontSize: SizeConfig.screenheight*0.04,
                               color: AllColor.whitecolor),
                            ),
                            Text(
                              "Login!",
                              style: TextStyle(
                                  fontSize: SizeConfig.screenheight*0.045,
                                  color: AllColor.whitecolor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: SizeConfig.screenheight*0.02),
                  Form(
                    key: _key,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: SizeConfig.screenheight*0.01,
                        horizontal: SizeConfig.screenheight*0.04,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            //
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
                              setState(() {
                                email=value;
                              });
                            },
                            validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Email";
                              }
                            },
                           // controller: _email,
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
                           SizedBox(height: SizeConfig.screenheight*0.01),
                          TextFormField(
                            obscureText: true,
                            //
                            onChanged: (value){
                              setState(() {
                                password=value;
                              });
                            },
                            validator: (value){
                              if(value.length<5){
                                return "Enter Corrcet Password";
                              }
                            },
                           // controller: _password,
                            //
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontSize: SizeConfig.screenheight*0.025
                              ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  SizeConfig.screenwidth*0.06
                                )
                              )
                            ),
                             
                             labelText: "Password",
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenheight*0.01),
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
                                          _value=val;
                                        });
                                      },
                                    ),
                                     SizedBox(width: SizeConfig.screenheight*0.005),
                                    Text(
                                      "Remember me",
                                      style: Theme.of(context).textTheme.caption,
                                    )
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Forgot Password ?",
                                    style: TextStyle(color: AllColor.orangecolor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  )
                                ]),
                              )
                            ],
                          ),
                           SizedBox(height: SizeConfig.screenheight*0.02),
                          Container(
                            width: SizeConfig.screenwidth * 0.35,
                                height: SizeConfig.screenheight * 0.05,
                            decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(
                               SizeConfig.screenheight*0.04
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
                               SizeConfig.screenheight*0.04
                             ),
                                ),
                                onPressed: login,
                                color: Colors.orange,
                                child: Text(
                             "Login",
                             style: Theme.of(context)
                                 .textTheme
                                 .headline6
                                 .apply(color: AllColor.whitecolor),
                                ),
                              ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenheight * 0.025,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Create account ?",
                                style: TextStyle(color: AllColor.blackcolor),
                              ),
                              TextSpan(
                                text: " Sign Up",
                                style: TextStyle(fontSize:SizeConfig.screenheight*0.022 ,
                                color: AllColor.orangecolor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushNamed(context, "/register"),
                              )
                            ]),
                          )
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
