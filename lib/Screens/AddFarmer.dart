// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Screens/AddCrop.dart';

class Addfarmer extends StatefulWidget {
  const Addfarmer({Key? key}) : super(key: key);

  @override
  _AddfarmerState createState() => _AddfarmerState();
}

String dropdownValue = 'Select District';
String dropdownValue1 = 'Select Mandal';
String dropdownValue2 = 'Select Village';
String dropdownValue3 = 'Select Constituency';

class _AddfarmerState extends State<Addfarmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(FontAwesomeIcons.bell),
          // ignore: prefer_const_constructors
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add Farmer's Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  label: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Enter Farmer Name',
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
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  label: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Enter Aadhar Number',
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
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  label: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Enter Phone Number',
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
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  label: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Enter Pincode',
                          style: TextStyle(
                              letterSpacing: 1.1,
                              fontSize: 14,
                              color: Colors.black,
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
              const SizedBox(height: 10),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Select District',
                    'Orange',
                    'Mango',
                    'Apple',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  onChanged: (String? newValue1) {
                    setState(() {
                      dropdownValue1 = newValue1!;
                    });
                  },
                  items: <String>[
                    'Select Mandal',
                    'Apple',
                    'Orange',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.1,
                            fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue2,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownValue2 = newValue2!;
                    });
                  },
                  items: <String>[
                    'Select Village',
                    'Apple',
                    'Orange',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.1,
                            fontSize: 14),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  dropdownColor: Colors.white,
                  value: dropdownValue3,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  onChanged: (String? newValue3) {
                    setState(() {
                      dropdownValue3 = newValue3!;
                    });
                  },
                  items: <String>[
                    'Select Constituency',
                    'Apple',
                    'Orange',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    );
                  }).toList(),
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
                        primary: Color(0xFF0A918A), //background color of button
                        //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(6.0)),
                        //content padding inside button
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCrop(),
                                fullscreenDialog: true));
                        // if (formGlobalKey.currentState!.validate()) {}
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
