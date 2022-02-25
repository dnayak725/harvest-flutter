// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Model/HistoryCorpData.dart';
import 'package:havest/Screens/LoginScreen.dart';
import 'package:havest/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CropsHistory extends StatefulWidget {
  @override
  State<CropsHistory> createState() => _CropsHistoryState();
}

class _CropsHistoryState extends State<CropsHistory> {
  @override
  HistoryCorpResponse? corpdatalist;
  _corpHistoryList() {
    final service = CorpHistoryService();
    service.corphistory().then((data) async {
      if (data.status == "success") {
        setState(() {
          corpdatalist = data;
          print(corpdatalist);
        });
      } else {
        print(data.status);
      }
    });
  }

  void initState() {
    _corpHistoryList();

    // TODO: implement initState
    super.initState();
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
                "Crop History",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          corpdatalist != null
              ? Expanded(
                  child: ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: corpdatalist!.response.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          // width: EdgeInsets.,
                          child: Card(
                            margin: EdgeInsets.all(1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  // leading: Icon(Icons.album),
                                  title: Text(
                                    "Farmer Name : ${corpdatalist!.response[index].getFarmer.name}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      'Farmer ID: ${corpdatalist!.response[index].farmerId}'),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 16.0, right: 16.0, bottom: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        'Commodity Group: ${corpdatalist!.response[index].getCommodityDetail.commodityName}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Parent Commodity: ${corpdatalist!.response[index].getParentCommodity.pcName}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Commodity Type: ${corpdatalist!.response[index].getProduct.name}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Unit Price: Rs.${corpdatalist!.response[index].getPrice.price}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Quantity: ${corpdatalist!.response[index].productQuantity}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
    );
  }
}
