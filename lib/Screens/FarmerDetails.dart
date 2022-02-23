// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FarmerDetails extends StatefulWidget {
  const FarmerDetails({Key? key}) : super(key: key);

  @override
  _FarmerDetailsState createState() => _FarmerDetailsState();
}

class _FarmerDetailsState extends State<FarmerDetails> {
  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(FontAwesomeIcons.bell),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 10),
            child: Icon(FontAwesomeIcons.powerOff),
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
      key: _scaffoldKey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Farmers Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Farmer Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  "John amin",
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: Text(
                  'Farmer Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  "John amin",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
