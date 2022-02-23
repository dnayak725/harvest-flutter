// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Screens/FarmerDetails.dart';

class AddCrop extends StatefulWidget {
  const AddCrop({Key? key}) : super(key: key);

  @override
  _AddCropState createState() => _AddCropState();
}

String dropdownValue = 'Select Commodity Type';
String dropdownValue1 = 'Select Parent Commodity';
String dropdownValue2 = 'Select Commodity Variety';

class _AddCropState extends State<AddCrop> {
  @override
  int selected = 0;
  String value = "";
  List<String> RadioList = ["RS 100", "RS 200", "RS 300"];
  Widget customradio(String text, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = index;
            value = text;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: (selected == index) ? Color(0xFF238A83) : Colors.white,
            ),
            width: 80,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: (selected == index) ? Colors.white : Colors.black,
              ),
            ),
          ),
        ));
  }

  Widget build(BuildContext context) {
    print(value);
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
                    "Add Corp Data",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Farmer Name : ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text("John Wayne")
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
                    Text("1234566")
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
                    Text("12345678901")
                  ],
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
                                color: Colors.black,
                                fontSize: 14,
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
                    'Select Commodity Type',
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
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  elevation: 16,
                  onChanged: (String? newValue1) {
                    setState(() {
                      dropdownValue1 = newValue1!;
                    });
                  },
                  items: <String>[
                    'Select Parent Commodity',
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
                    'Select Commodity Variety',
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
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 68,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return customradio(RadioList[index], index);
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
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
                            text: 'UOM is Quintal',
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SizedBox(
                  height: 62, //height of button
                  width: double.infinity,
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
                                builder: (context) => FarmerDetails(),
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
