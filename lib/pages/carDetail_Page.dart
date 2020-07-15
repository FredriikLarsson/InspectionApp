import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspection_app/pages/bookInspection_Page.dart';

class CarDetailPage extends StatefulWidget {
  final String _chosenCar;

  CarDetailPage(this._chosenCar);

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  final List<String> listItem = [
    "Regnr",
    "HWP566",
    "Bilmodell",
    "BWM118D",
    "Färg",
    "Röd",
    "Årsmodell",
    "2011",
    "Mer biluppgifter",
    "Fordonsstatus",
    "Påställd (2019-10-10)",
    "Mätarställning",
    "134000",
    "Bilskatt",
    "3005kr"
  ];

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 24.0, top: 17),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: isExpanded == true ? 15 : 9,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildItems(context, index);
                  })),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.only(bottom: 24),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Text("Ska senast besiktas", style: _textStyle(1)),
                  Text("2020-03-15", style: _textStyle(2)),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookInspectionPage()));
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ])),
                            padding: EdgeInsets.all(10.0),
                            child: const Text(
                              "Boka besiktning",
                              style: TextStyle(fontSize: 17),
                            ))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle _textStyle(value) {
    if (value == 1) {
      return TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7));
    } else if (value == 3) {
      return TextStyle(fontSize: 16, color: Colors.blue);
    } else {
      return TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
    }
  }

  Widget _buildItems(BuildContext context, int index) {
    if ((index % 2 == 0) && (index < 8) || ((index % 2 == 1) && index > 8)) {
      return Padding(
        padding: EdgeInsets.only(top: 7),
        child: Text(listItem[index], style: _textStyle(1)),
      );
    } else if (index == 8) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isExpanded == true ? isExpanded = false : isExpanded = true;
          });
        },
        child: Padding(
          child: isExpanded == true
              ? Text(
                  "Mindre biluppgifter",
                  style: _textStyle(3),
                )
              : Text(
                  listItem[index],
                  style: _textStyle(3),
                ),
          padding: EdgeInsets.only(top: 7),
        ),
      );
    } else {
      return Text(
        listItem[index],
        style: _textStyle(2),
      );
    }
  }
}
