import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _countDown = 10;
  bool _enableResend = false;
  Timer _timer;

  countDownTimer() {
    if (_enableResend) {
      setState(() {
        _countDown = 10;
      });
    }
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_countDown < 1) {
          _enableResend = true;
          _timer.cancel();
        } else {
          _countDown--;
        }
      });
    });
  }

  @override
  void initState() {
    countDownTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.navigate_before),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenheight * 0.1),
              Text(
                "Verification Code",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: SizeConfig.screenheight * 0.02),
              Text("Please enter verification code"),
              Text("Sent on given number"),
              SizedBox(height: SizeConfig.screenheight * 0.1),
              Form(
                key: _fbKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenwidth * 0.08,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenwidth * 0.04),
                    SizedBox(
                      width: SizeConfig.screenwidth * 0.08,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenwidth * 0.04),
                    SizedBox(
                      width: SizeConfig.screenwidth * 0.08,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenwidth * 0.04),
                    SizedBox(
                      width: SizeConfig.screenwidth * 0.08,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.screenwidth * 0.04),
                    SizedBox(
                      width: SizeConfig.screenwidth * 0.08,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenheight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("0:0$_countDown"),
                  SizedBox(width: SizeConfig.screenwidth * 0.02),
                  FlatButton(
                    onPressed: _enableResend
                        ? () {
                            countDownTimer();
                          }
                        : null,
                    child: Text(
                      "resend",
                      style: TextStyle(color: AllColor.greycolor),
                    ),
                  )
                ],
              ),
              SizedBox(height: SizeConfig.screenheight * 0.02),
              MaterialButton(
                minWidth: SizeConfig.screenwidth * 0.8,
                height: SizeConfig.screenheight * 0.04,
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text("You are Verified now"),
                  ));
                  Future.delayed(
                      Duration(seconds: 2), () => Navigator.of(context).pop());
                },
                color: AllColor.orangecolor,
                child: Text(
                  "Verify",
                  style: TextStyle(
                    color: AllColor.whitecolor,
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
