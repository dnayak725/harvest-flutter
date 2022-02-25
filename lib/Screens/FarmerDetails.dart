// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Model/farmerAdd.dart';
import 'package:havest/Screens/AddCrop.dart';
import 'package:havest/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmerDetails extends StatefulWidget {
  final String fName;
  final String id;
  final String adhaar;
  final String phoneNumber;
  final String pinCode;
  const FarmerDetails(
      this.id, this.fName, this.adhaar, this.phoneNumber, this.pinCode);

  @override
  _FarmerDetailsState createState() => _FarmerDetailsState();
}

class _FarmerDetailsState extends State<FarmerDetails> {
  @override
  _addCorp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("farmername", widget.fName);
    sharedPreferences.setString("adharnumber", widget.adhaar);
    sharedPreferences.setString("farmerid", widget.id);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddCrop(), fullscreenDialog: true));
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
                  'ID',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.id,
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
                  widget.fName,
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
                  'Aadhaar No',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.adhaar,
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
                  'Phone No',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.phoneNumber,
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
                  'Pin Code',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: Text(
                  widget.pinCode,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        child: Card(
          elevation: 20,
          margin: EdgeInsets.zero,
          child: Container(
            height: 70,
            width: 225,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 192,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6ED097),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      _addCorp();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(FontAwesomeIcons.plusCircle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add Corp Data",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
