import 'package:flutter/cupertino.dart';
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
  Future<List<Car>> cars;
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      cars = dbHelper.getCars();
    });
  }

  SingleChildScrollView dataTable(List<Car> cars) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        dataRowHeight: 70,
        columnSpacing: 90,
        headingRowHeight: 0,
        columns: [
          DataColumn(label: Text("")),
          DataColumn(label: Text("")),
          DataColumn(label: Text("")),
        ],
        rows: cars
            .map(
              (car) => DataRow(cells: [
                DataCell(_convertToIcon(car.carIcon)),
                DataCell(
                  Text(car.regNr),
                ),
                DataCell(Text("Besiktad")),
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
        if (snapshot.hasData) {
          return dataTable(snapshot.data);
        } else if (snapshot.data == null || snapshot.data.length == 0) {
          return Text("no data found");
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }

  Icon _convertToIcon(int carIcon) {
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

/*    return ListView.builder(
        itemCount: 17,
        itemBuilder: (BuildContext context, int index) {
          return _buildItems(context, index); //Calls for a method to build the items in the listview
        });*/

/*  Widget _buildItems(BuildContext context, int index) {
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
  }*/

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
