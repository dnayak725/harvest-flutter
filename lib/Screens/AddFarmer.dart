// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Model/GetDistrict.dart';
import 'package:havest/Model/GetMondal.dart';
import 'package:havest/Model/GetVillage.dart';
import 'package:havest/Screens/AddCrop.dart';
import 'package:havest/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Addfarmer extends StatefulWidget {
  const Addfarmer({Key? key}) : super(key: key);

  @override
  _AddfarmerState createState() => _AddfarmerState();
}

List<Responsed> dist = [];
List<Responsem> mondal = [];
List<Response> village = [];
final nameController = TextEditingController();
final aadharController = TextEditingController();
final phoneController = TextEditingController();
final pincodeController = TextEditingController();
var dropdownValue;
var dropdownValue1;
var dropdownValue2;
String dropdownValue4 = 'Select Village';
String dropdownValue3 = 'Select Constituency';

class _AddfarmerState extends State<Addfarmer> {
  @override
  _farmeradd() async {
    final service = FarmerAddApiService();
    service.farmeradd({
      "name": nameController.text.toString(),
      "aadhar_number": aadharController.text.toString(),
      "phone_number": phoneController.text.toString(),
      "pin_code": pincodeController.text.toString(),
      "district_id": dropdownValue.toString(),
      "mandal_id": dropdownValue1.toString(),
      "village_id": "12",
      "assembly_constituency_id": "1234",
      "parliament_constituency_id": "2356646"
    }).then(
      (value) async {
        if (value.status == "success") {
          print(value.response);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          sharedPreferences.setString("farmername", value.response.name);
          sharedPreferences.setString(
              "adharnumber", value.response.aadharNumber);
          sharedPreferences.setString("farmerid", value.response.id.toString());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddCrop(), fullscreenDialog: true));
        } else {
          _scaffoldKey.currentState!
              .showSnackBar(SnackBar(content: Text("Farmer is already exist")));
        }
      },
    );
  }

  GetDistrictResponse? districtlist;
  _getdistrict() {
    final service = GetDistrictApiService();
    service.getdistrict().then((data) async {
      if (data.status == "success") {
        setState(() {
          districtlist = data;

          dist = districtlist!.response;
        });
      } else {
        print(data.status);
      }
    });
  }

  GetMondalResponse? mondaltlist;
  _getmondal() {
    print("object");
    final service = GetMondalApiService();
    service.getmondal(dropdownValue).then((data) async {
      if (data.status == "success") {
        setState(() {
          mondaltlist = data;
          mondal = mondaltlist!.response;
          print(mondal[0].name);
        });
      } else {
        print(data.status);
      }
    });
  }

  GetVillagelResponse? villagetlist;
  _getvillage() {
    final service = GetVillageApiService();
    service.getvillage(1).then((data) async {
      if (data.status == "success") {
        setState(() {
          villagetlist = data;
          village = villagetlist!.response;
          print(mondal[0].name);
        });
      } else {
        print(data.status);
      }
    });
  }

  void initState() {
    _getdistrict();

    // TODO: implement initState
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    print(mondal);
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
      key: _scaffoldKey,
      body: dist != null
          ? SingleChildScrollView(
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: nameController,
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
                      controller: aadharController,
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
                      controller: phoneController,
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
                      controller: pincodeController,
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
                      child: DropdownButtonFormField(
                        hint: Text("Select District"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: borderStyle(),
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        value: dropdownValue,
                        items: dist.map((e) {
                          print(e);
                          return DropdownMenuItem(
                              value: e.id, child: Text(e.name));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownValue = value;
                            _getmondal();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: DropdownButtonFormField(
                        hint: Text("Select Mondal"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          border: borderStyle(),
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        value: dropdownValue1,
                        items: mondal.map((e) {
                          return DropdownMenuItem(
                              value: e.id, child: Text(e.name));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownValue1 = value;
                            // _getvillage();
                          });
                        },
                      ),
                    ),
                    // const SizedBox(height: 10),
                    // Container(
                    //   child: DropdownButtonFormField(
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.symmetric(
                    //           vertical: 18, horizontal: 20),
                    //       border: borderStyle(),
                    //       enabledBorder: borderStyle(),
                    //       focusedBorder: borderStyle(),
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //     ),
                    //     value: dropdownValue2,
                    //     items: mondal.map((e) {
                    //       return DropdownMenuItem(
                    //           value: e.id, child: Text(e.name));
                    //     }).toList(),
                    //     onChanged: (value) {
                    //       setState(() {
                    //         dropdownValue2 = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    Container(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: borderStyle(),
                          enabledBorder: borderStyle(),
                          focusedBorder: borderStyle(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: dropdownValue4,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        elevation: 16,
                        onChanged: (String? newValue4) {
                          setState(() {
                            dropdownValue4 = newValue4!;
                          });
                        },
                        items: <String>[
                          'Select Village',
                          'village 1',
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
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
                          'Constituency 1',
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
                              primary: Color(
                                  0xFF0A918A), //background color of button
                              //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(6.0)),
                              //content padding inside button
                            ),
                            onPressed: () {
                              _farmeradd();

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
            )
          : Container(),
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
