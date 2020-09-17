import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import './loginPage.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /* decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/BannerImage.jpg",
              ),
              fit: BoxFit.fill)), */
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(50),
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/tiktok.png"),
                  height: 200,
                ),
              ),
            )),
      ),
    );
  }
}
