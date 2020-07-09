import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspection_app/pages/carDetail_Page.dart';

class HomePageCarList extends StatefulWidget {
  @override
  _HomePageCarListState createState() => _HomePageCarListState();
}

class _HomePageCarListState extends State<HomePageCarList> {
  final List<String> carList = [
    "HWP566",
    "JKD606",
    "DDR221",
    "DSD990",
    "IKO887",
    "YTR921",
    "HWP566",
    "JKD606",
    "DDR221",
    "DSD990",
    "IKO887",
    "YTR921"
  ];
  final List<IconData> carListIcon = [
    Icons.airport_shuttle,
    Icons.drive_eta,
    Icons.threesixty,
    Icons.directions_bus,
    Icons.threesixty,
    Icons.directions_bus,
    Icons.airport_shuttle,
    Icons.drive_eta,
    Icons.threesixty,
    Icons.directions_bus,
    Icons.threesixty,
    Icons.directions_bus
  ];
  final List<String> carListText = [
    "Körförbud",
    "Körförbud",
    "Körförbud",
    "4 dagar   ",
    "4 dagar   ",
    "4 dagar   ",
    "Besiktad",
    "Besiktad",
    "Besiktad",
    "Besiktad",
    "Besiktad",
    "Besiktad"
  ];

/*  String _showCarDetail;*/

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: carList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItems(context, index); //Calls for a method to build the items in the listview
        });
  }

  Widget _buildItems(BuildContext context, int index) {
    return GestureDetector(

      //OnTap go to the detailpage of a specific car from the carList
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailPage(carList[index])));
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          height: 70,
          child: Card(
              child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(carListIcon[index])),
              Expanded(
                  child: Text(
                carList[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
              Container(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(carListText[index],
                      style: TextStyle(color: _checkTextColor(index)))),
            ],
          ))),
    );
  }

  //Method to check the status of the car and colorcode the text depending on the value it have
  Color _checkTextColor(index) {
    if (carListText[index] == "Körförbud") {
      return Colors.red;
    } else if (carListText[index] == "Besiktad") {
      return Colors.green;
    } else {
      return Colors.orangeAccent;
    }
  }
}
