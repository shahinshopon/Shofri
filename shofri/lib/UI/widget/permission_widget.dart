import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class PermissionScaffold extends StatefulWidget {
  final Permission permission;
  final Widget child;
  final String description;
  final String title;
  final String imageSrc;

  PermissionScaffold({
    Key key,
    @required this.permission,
    this.child,
    this.description,
    this.title,
    this.imageSrc,
  }) : super(key: key);

  @override
  _PermissionScaffoldState createState() => _PermissionScaffoldState();
}

class _PermissionScaffoldState extends State<PermissionScaffold> {
  bool isGranted = false;
  bool isInitialized = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) {
      widget.permission.status.then((value) {
        if (value == PermissionStatus.granted) {
          setState(() {
            isGranted = true;
            isInitialized = true;
          });
          return;
        }

        setState(() {
          isInitialized = true;
        });
      });
    } else {
      isGranted = true;
      isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return SafeArea(
              child: Scaffold(
          key: scaffoldKey,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (isInitialized && isGranted) {
      return widget.child;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color:AllColor.orangecolor),
        backgroundColor: AllColor.rgbocolor,
        title: Text(widget.title, style: TextStyle(color: AllColor.orangecolor)),
      ),
      body: Container(
        color: AllColor.rgbocolor,
        alignment: Alignment.center,
        padding: EdgeInsets.all(SizeConfig.screenheight*0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              widget.imageSrc,
              width: 150,
              height: 150,
            ),
             SizedBox(
              height: 8.0,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () async {
                if (widget.permission is PermissionWithService) {
                  final serviceStatus =
                      await (widget.permission as PermissionWithService)
                          .serviceStatus;

                  if (!serviceStatus.isEnabled) {
                    final snackBar = SnackBar(
                      content: Text(
                        "${widget.title} Service is not available",
                      ),
                    );
                    scaffoldKey.currentState.showSnackBar(snackBar);
                    return;
                  }
                }

                final status = await widget.permission.request();
                if (status.isGranted) {
                  setState(() {
                    isGranted = true;
                  });
                  return;
                }

                if (status.isDenied) {
                  final snackBar = SnackBar(
                    content: Text("${widget.title} permission denied"),
                  );
                  scaffoldKey.currentState.showSnackBar(snackBar);
                  return;
                }

                if (status.isPermanentlyDenied) {
                  openAppSettings();
                }
              },
              child: Text(
                "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
