

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

typedef Future<bool> QRScannelEventHandler({String code});

class QRScanner extends StatefulWidget {
  final QRScannelEventHandler onReceived;

  QRScanner({Key key, @required this.onReceived}) : super(key: key);

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  GlobalKey qrKey = GlobalKey();
  QRViewController controller;
  bool isFlashOn = false;
  bool isBusy = false;
  String lastQR;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                this.controller = controller;
                this.controller.scannedDataStream.listen((event) async {
                  if (lastQR == event) return;
                  lastQR = event;

                  if (isBusy) return;
                  isBusy = true;
                  controller.pauseCamera();

                  final result = await widget.onReceived(code: event);
                  if (result ?? false) {
                    controller.resumeCamera();
                  }

                  isBusy = false;
                });
              },
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: InvertedCircleClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 8.0,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 24,
            child: SafeArea(
              child: Text(
                "Place QR Code inside View Finder",
                style: TextStyle(
                 
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            child: SafeArea(
              child: FloatingActionButton(
                elevation: 0.0,
                backgroundColor: Colors.white54,
                child: Icon(Icons.flash_on),
                onPressed: () {
                  controller.toggleFlash();
                  setState(() {
                    isFlashOn = !isFlashOn;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    super.dispose();
  }
}

class InvertedCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return new Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
            0 + size.width / 5,
            (size.height / 2) - ((size.width - (size.width / 5 * 2)) / 2),
            size.width - size.width / 5,
            (size.height / 2) + ((size.width - (size.width / 5 * 2)) / 2),
          ),
          Radius.circular(16.0),
        ),
      )
      ..addRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
