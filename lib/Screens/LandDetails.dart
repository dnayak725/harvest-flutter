// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandDetails extends StatefulWidget {
  const LandDetails({Key? key}) : super(key: key);

  @override
  State<LandDetails> createState() => _LandDetailsState();
}

class _LandDetailsState extends State<LandDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // Icon(FontAwesomeIcons.bell),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 10),
            child: GestureDetector(
                onTap: () async {
                  {
                    {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove("userstatus");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  }
                },
                child: Icon(FontAwesomeIcons.powerOff)),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Image.asset(
            "assets/images/logo.png",
            width: 180,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF238A83), Color(0xFF0A918A)]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Land Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
