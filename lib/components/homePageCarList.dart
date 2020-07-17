import 'package:flutter/material.dart';
import 'package:inspection_app/data/dbHelper.dart';
import 'package:inspection_app/pages/carDetail_Page.dart';
import 'package:inspection_app/data/car.dart';
import 'dart:async';

class HomePageCarList extends StatefulWidget {
  @override
  _HomePageCarListState createState() => _HomePageCarListState();
}

class _HomePageCarListState extends State<HomePageCarList> {

  //List of cars that is going to get cars from the database and create a list on the homescreen
  Future<List<Car>> cars;

  //Database is initialized and stored in this variable
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshList();
  }

  //Update the list "cars" with the latest list of cars in the database
  refreshList() {
    setState(() {
      cars = dbHelper.getCars();
    });
  }

  //Taking in the list of cars as an argument to map it out in rows and data cells
  SingleChildScrollView dataTable(List<Car> cars) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        dataRowHeight: 70,
        columnSpacing: 93,
        headingRowHeight: 0,
        columns: [
          DataColumn(label: Text("")),
          DataColumn(label: Text("")),
          DataColumn(label: Text("")),
        ],
        rows: cars
            .map(
              (car) => DataRow(cells: [
                DataCell(_convertToIcon(car.carIcon), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailPage(car)));
                }),
                DataCell(
                  Text(car.regNr), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailPage(car)));
                }
                ),
                DataCell(Text("Besiktad"), onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailPage(car)));
                }),
              ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: cars,
      builder: (context, snapshot) {

        //Checking if database has data or not and showing relevant information
        if (snapshot.hasData && snapshot.data.length > 0) {
          return dataTable(snapshot.data);
        } else if (snapshot.data == null || snapshot.data.length == 0) {
          return Center(child: Text("Din lista är tom", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),));
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }

  //Return an icon based on what user has chosen from the addcarGridList
  Icon _convertToIcon(int carIcon) {

    //This list is indirectly linked to both the _listSelections for first and secondrow in addCarGridList
    //_icons[0-3] == listSelectionsfirstrow, _icons[4-7] == listSelectionsecondRow
    List<IconData> _icons = [
      Icons.directions_car,
      Icons.airport_shuttle,
      Icons.directions_bus,
      Icons.local_shipping,
      Icons.motorcycle,
      Icons.local_car_wash,
      Icons.train,
      Icons.directions_bike
    ];

    if (carIcon == -1) {
      return Icon(
        Icons.close,
        color: Colors.black,
      );
    } else {
      return Icon(
        _icons[carIcon],
        color: Colors.black,
      );
    }
  }
}



//Method to check the status of the car and colorcode the text depending on the value it have
/*  Color _checkTextColor(index) {
    if (carListText[index] == "Körförbud") {
      return Colors.red;
    } else if (carListText[index] == "Besiktad") {
      return Colors.green;
    } else {
      return Colors.orangeAccent;
    }
  }*/