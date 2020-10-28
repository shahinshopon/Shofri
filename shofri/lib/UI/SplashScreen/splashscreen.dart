import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shofri/ResponsiveDesign/sizeconfig.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/shofri-intro.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, "/onbording"));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}