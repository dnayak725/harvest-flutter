// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Screens/AddFarmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
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
                        // controller: searchController,
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
                "Farmer ID ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              title: Center(
                  child: Text(
                "Farmer Name",
                style: TextStyle(fontWeight: FontWeight.w600),
              ))),
          Expanded(
            child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(1),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                          leading: Text('${index + 1}'),
                          trailing: Text(
                            "124",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          title: Center(
                            child: Text(
                              "Farmer Name",
                              style: TextStyle(color: Color(0xFF0A918A)),
                            ),
                          )),
                    ),
                  );
                }),
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
