import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/LogIn/loginpage.dart';
import 'package:shofri/UI/SignUp/verificationpage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  signup (String name,phone,email,password)async{
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
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool _value = false;
  String smsCode;
  String verificationCode;
  String number;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      child: Image.asset(
                        "assets/circle.png",
                        height: SizeConfig.screenheight * 0.4,
                      ),
                    ),
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
                            "Hello,",
                            style: TextStyle(
                                fontSize: SizeConfig.screenheight * 0.04,
                                color: AllColor.whitecolor),
                          ),
                          Text(
                            "Sign Up!",
                            style: TextStyle(
                                fontSize: SizeConfig.screenheight * 0.045,
                                color: AllColor.whitecolor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenheight * 0.02),
                Form(
                  key: _fbKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenheight * 0.01,
                      horizontal: SizeConfig.screenheight * 0.04,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Name";
                              }
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
                        SizedBox(height: SizeConfig.screenheight * 0.01),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                              if(value.isEmpty){
                                return "Enter Your Email";
                              }
                            },
                          
                          controller: _email,
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
                        SizedBox(height: SizeConfig.screenheight * 0.01),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value){
                              if(value.length>10){
                                return "Number atlest 11 digit";
                              }
                            },
                            onChanged: (val){
                  number=val;
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
                            labelText: "Phone",
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.01),
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
                            labelText: "Password",
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.01),
                        TextFormField(
                          obscureText: true,
                          validator: (value){
                              if(value.length<6){
                                return "Passwod atlest 6 digit";
                              }
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
                            labelText: "Confirm Password",
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.01),
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
                                      width: SizeConfig.screenheight * 0.005),
                                  Text(
                                    "I accept policy and terms",
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.01),
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
                                  SizeConfig.screenheight * 0.04),
                            ),
                            onPressed:signup(name,phone,_email,_password),
                           // onPressed: () {
                            //  Navigator.of(context).pushNamed("/verification");
                           // },
                            color: Colors.orange,
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .apply(color: AllColor.whitecolor),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.02),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Already have an Account ?",
                              style: TextStyle(
                                color: AllColor.blackcolor,
                                fontSize: SizeConfig.screenheight * 0.017,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.of(context).pushNamed("/login"),
                              text: " Login",
                              style: TextStyle(
                                color: AllColor.orangecolor,
                                fontSize: SizeConfig.screenheight * 0.025,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: SizeConfig.screenheight * 0.02),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  //
  
}

