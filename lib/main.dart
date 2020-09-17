import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok/screens/home.dart';
import 'package:tiktok/screens/loginPage.dart';
import 'package:tiktok/screens/registerPage.dart';
import 'package:tiktok/screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'TikTok UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Login(),
      //home: HomePage(),
      routes: {
        '/': (context) => SplashScreenPage(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
