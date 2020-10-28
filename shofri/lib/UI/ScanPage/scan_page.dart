

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:shofri/UI/widget/permission_widget.dart';
import 'package:shofri/UI/widget/qr_scanner.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Function get callback => ModalRoute.of(context).settings.arguments;

  @override
  Widget build(BuildContext context) {
    return PermissionScaffold(
      permission: Permission.camera,
      title: "Camera Access",
      description:
          "This Application need access to your camera in order to scan QRCode",
      imageSrc: "assets/scan-qr.png",
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AllColor.orangecolor),
          backgroundColor:AllColor.rgbocolor,
          title: Text(
            "QR Scan",
            style: TextStyle(fontSize:SizeConfig.screenheight*0.025,color:AllColor.orangecolor),
          ),
        ),
        body: buildBody(),
      ),
    );
  }

  Future<bool> onReceived({String code}) async {
    try {
      if (callback != null) {
        callback(code);
        Navigator.pop(context);
        return true;
      }
    } catch (e) {
      print(e);
    }

    Navigator.pop(context);
    return false;
  }

  buildBody() {
    return QRScanner(
      onReceived: onReceived,
    );
  }
}
