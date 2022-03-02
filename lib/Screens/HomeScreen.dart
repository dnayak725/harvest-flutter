// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Model/FarmerList.dart';
import 'package:havest/Screens/AddFarmer.dart';
import 'package:havest/Screens/FarmerDetails.dart';
import 'package:havest/Screens/Historydata.dart';
import 'package:havest/Screens/LoginScreen.dart';
import 'package:havest/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FarmerListResponse? farmerlist;
  List<Response> _foundUsers = [];

  _farmerList() {
    final service = FarmerListApiService();
    service.farmerlist().then((data) async {
      if (data.status == "success") {
        setState(() {
          farmerlist = data;
          _foundUsers = farmerlist!.response;
        });
      } else {
        print(data.status);
      }
    });
  }

  @override
  void initState() {
    _farmerList();

    // TODO: implement initState
    super.initState();
  }

// This function is called whenever the text field changes

  void _runFilter(String enteredKeyword) {
    List<Response> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = farmerlist!.response;
    } else {
      results = farmerlist!.response
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // Icon(FontAwesomeIcons.list),
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CropsHistory()));
            },
          ),
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
      drawer: Drawer(),
      key: _scaffoldKey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Farmers List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 1, bottom: 1, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                ],
              ),
              height: 50,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 10),
                    child: Stack(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          // ignore: prefer_const_constructors
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.black54,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        onChanged: (value) => _runFilter(value),

                        // ignore: unnecessary_new
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Search"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
              leading: Text(
                "Sno",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                "Farmer Name",
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          farmerlist != null
              ? Expanded(
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: _foundUsers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // print('hrllo world');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FarmerDetails(
                                          _foundUsers[index].id.toString(),
                                          _foundUsers[index].name,
                                          _foundUsers[index]
                                              .aadharNumber
                                              .toString(),
                                          _foundUsers[index]
                                              .phoneNumber
                                              .toString(),
                                          _foundUsers[index].pinCode.toString(),
                                        )));
                          },
                          child: Card(
                            margin: EdgeInsets.all(1),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: ListTile(
                                  leading: Text('${index + 1}'),
                                  trailing: Text(
                                    _foundUsers[index].name,
                                    style: TextStyle(color: Color(0xFF0A918A)),
                                  )),
                            ),
                          ),
                        );
                      }),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Text("No data found"),
                )
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
                width: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6ED097),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addfarmer()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(FontAwesomeIcons.plusCircle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add Farmer",
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
