import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

import 'package:havest/Screens/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async => Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
        ));
  }

  Future getValidationData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF238A83),
        child: Image.asset(
          "assets/images/logo.png",
          width: 200,
        ),
      ),
    );
  }
}
