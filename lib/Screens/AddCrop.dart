// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Model/CommodityVariety.dart';
import 'package:havest/Model/ParentCommodity.dart';
import 'package:havest/Model/comodity.dart';
import 'package:havest/Screens/FarmerDetails.dart';
import 'package:havest/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCrop extends StatefulWidget {
  const AddCrop({Key? key}) : super(key: key);

  @override
  _AddCropState createState() => _AddCropState();
}

var dropdownValue;
var dropdownValue1;
var dropdownValue2;
var farmerName;
var farmerId;
var farmerAadhar;
List<Responsec> commodity = [];
List<Responsep> parentcommodity = [];
List<Response> commodityvariety = [];
final phoneController = TextEditingController();
final quantityController = TextEditingController();

class _AddCropState extends State<AddCrop> {
  @override
  _addcorpdata() async {
    final service = AddCorpApiService();
    service.addcorpdata({
      "farmer_id": '15',
      "aadhar_number": "152485",
      "commodity_id": '1',
      "parent_commodity_id": '1',
      "product_id": '1',
      "price_id": '1',
      "product_quantity": "15"
    }).then(
      (value) async {
        if (value.status == "success") {
          print(value.response);
          print(value.message);

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => AddCrop(), fullscreenDialog: true));
        } else {
          _scaffoldKey.currentState!
              .showSnackBar(SnackBar(content: Text(value.message)));
        }
      },
    );
  }

  _getfarmerData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      farmerName = sharedPreferences.getString("farmername");
      farmerId = sharedPreferences.getString("farmerid");
      farmerAadhar = sharedPreferences.getString("adharnumber");
    });
  }

  ParentComodityResponse? parentcomoditylist;
  _getparentCommodity() {
    final service = ParentCommodityApiService();
    service.getparentcommodity(dropdownValue).then((data) async {
      if (data.status == "success") {
        setState(() {
          parentcomoditylist = data;

          parentcommodity = parentcomoditylist!.response;
        });
      } else {
        print(data.status);
      }
    });
  }

  CommodityVarietyResponse? comodityvarietylist;
  _commodityVariety() {
    final service = CommodityVarietyApiService();
    service.commodityvariety({
      "parent_commodity_id": dropdownValue1.toString(),
      "commodity_id": dropdownValue.toString()
    }).then((data) async {
      if (data.status == "success") {
        setState(() {
          comodityvarietylist = data;

          commodityvariety = comodityvarietylist!.response;
        });
      } else {
        print(data.status);
      }
    });
  }

  ComodityResponse? comoditylist;
  _getComodity() {
    final service = ComodityApiService();
    service.getcommodity().then((data) async {
      if (data.status == "success") {
        setState(() {
          comoditylist = data;

          commodity = comoditylist!.response;
        });
      } else {
        print(data.status);
      }
    });
  }

  void initState() {
    _getfarmerData();
    _getComodity();
    // TODO: implement initState
    super.initState();
  }

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

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    print(value);
    return Scaffold(
      key: _scaffoldKey,
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
                child: DropdownButtonFormField(
                  hint: Text("Select Commodity Type"),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: dropdownValue,
                  items: commodity.map((e) {
                    print(e);
                    return DropdownMenuItem(
                        value: e.id, child: Text(e.commodityName));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value;
                    });
                    _getparentCommodity();
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: DropdownButtonFormField(
                  hint: Text("Select Parent Commodity"),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: dropdownValue1,
                  items: parentcommodity.map((e) {
                    return DropdownMenuItem(value: e.id, child: Text(e.pcName));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue1 = value;
                    });
                    _commodityVariety();
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: DropdownButtonFormField(
                  hint: Text("Select Commodity Variety"),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    border: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: dropdownValue2,
                  items: commodityvariety.map((e) {
                    return DropdownMenuItem(value: e.id, child: Text(e.name));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValue2 = value;
                    });
                    _commodityVariety();
                  },
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
                controller: quantityController,
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
                        _addcorpdata();
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
