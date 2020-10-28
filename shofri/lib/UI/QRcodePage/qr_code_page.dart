

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shofri/AllColor/allcolor.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';

class QrCodePage extends StatefulWidget {
  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  GlobalKey globalKey = new GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isGenerate;

  @override
  void initState() {
    _isGenerate = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final message =
        // ignore: lines_longer_than_80_chars
        'Hey this is a QR code. Change this value in the main_screen.dart file.';

    final qrFutureBuilder = FutureBuilder(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        final size = 280.0;
        if (!snapshot.hasData) {
          return Container(width: size, height: size);
        }
        return RepaintBoundary(
          key: globalKey,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: CustomPaint(
              size: Size.square(size),
              painter: QrPainter(
                data: message,
                version: QrVersions.auto,
                // size: 320.0,
                embeddedImage: snapshot.data,
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: MediaQuery.of(context).size,
                ),
              ),
            ),
          ),
        );
      },
    );

    takeScreenShot() async {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final directory = (await getApplicationDocumentsDirectory()).path;
      final tempDir = await getTemporaryDirectory();
      final file = await new File('$directory/image.png').create();
      await file.writeAsBytes(pngBytes);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Downloaded at $directory"),
      ));
      print(directory);
    }

    Future<void> _captureAndSharePng() async {
      try {
        RenderRepaintBoundary boundary =
            globalKey.currentContext.findRenderObject();
        var image = await boundary.toImage();
        ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final tempDir = await getTemporaryDirectory();
        final file = await new File('${tempDir.path}/image.png').create();
        await file.writeAsBytes(pngBytes);
        final channel = const MethodChannel('channel:me.alfian.share/share');
        channel.invokeMethod('shareFile', 'image.png');
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isGenerate
            ? () async {
                takeScreenShot();
              }
            : () {
                setState(() {
                  _isGenerate = true;
                });
              },
        label: _isGenerate
            ? Text(
                "Download QR Code",
                style: TextStyle(
                  color: AllColor.whitecolor,
                ),
              )
            : Text(
                "Generate QR Code",
                style: TextStyle(
                  color:AllColor.whitecolor,
                ),
              ),
        icon: _isGenerate
            ? Icon(
                Icons.save_alt,
                color: AllColor.whitecolor,
              )
            : Icon(
                Icons.view_quilt,
                color:AllColor.whitecolor,
              ),
        backgroundColor:AllColor.greencolor,
      ),
      body: _isGenerate
          ? Material(
              color: AllColor.whitecolor,
              child: SafeArea(
                top: true,
                bottom: true,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Container(
                            width: SizeConfig.screenwidth*0.7,
                            child: qrFutureBuilder,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/qr-code-wallpaper.png",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/qr-code-wallpaper.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
