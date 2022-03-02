// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLand extends StatefulWidget {
  const AddLand({Key? key}) : super(key: key);

  @override
  State<AddLand> createState() => _AddLandState();
}

final KhataNoController = TextEditingController();
final AreaQuantityController = TextEditingController();
final SurveyController = TextEditingController();
final formGlobalKey = GlobalKey<FormState>();

class _AddLandState extends State<AddLand> {
  var farmerName;
  var farmerId;
  var farmerAadhar;
  _getfarmerData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      farmerName = sharedPreferences.getString("farmername");
      farmerId = sharedPreferences.getString("farmerid");
      farmerAadhar = sharedPreferences.getString("adharnumber");
    });
  }

  void initState() {
    _getfarmerData();

    // TODO: implement initState
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add Land",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Farmer Name : ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(farmerName)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Farmer ID : ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(farmerId)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Aadhar Number : ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(farmerAadhar)
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: KhataNoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'plese enter khata number';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    label: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Enter khata number',
                              style: TextStyle(
                                  letterSpacing: 1.1,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ],
                    ),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: SurveyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'plese enter survey number';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    label: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Enter survey number',
                              style: TextStyle(
                                  letterSpacing: 1.1,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ],
                    ),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: AreaQuantityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'plese enter quantity';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    label: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Enter Quantity',
                            style: TextStyle(
                                letterSpacing: 1.1,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            // ignore: prefer_const_literals_to_create_immutables
                          ),
                        ),
                      ],
                    ),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 4),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: '*',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),

                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            TextSpan(
                              text: 'UOM is Acre',
                              style: TextStyle(
                                  letterSpacing: 1.1,
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    height: 62, //height of button
                    width: double.infinity, //width of button
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // ignore: prefer_const_constructors
                          primary:
                              Color(0xFF0A918A), //background color of button
                          //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(6.0)),
                          //content padding inside button
                        ),
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {}
                          // if (formGlobalKey.currentState!.validate()) {}
                          print("object");
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 17),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder borderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      color: Color(0xFFbfc6cb),
      style: BorderStyle.solid,
      width: 0.5,
    ),
  );
}
