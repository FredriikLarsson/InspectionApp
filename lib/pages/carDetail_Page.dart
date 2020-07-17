import 'package:flutter/material.dart';
import 'package:inspection_app/pages/bookInspection_Page.dart';
import 'package:inspection_app/data/car.dart';

class CarDetailPage extends StatefulWidget {
  final Car car;

  CarDetailPage(this.car);

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {

  //The list which the listview use to build up all the relevant data on the page.
  final List<String> listItem = [
    "Regnr",
    "---",
    "Bilmodell",
    "---",
    "Färg",
    "---",
    "Årsmodell",
    "---",
    "Mer biluppgifter",
    "Fordonsstatus",
    "---",
    "Mätarställning",
    "---",
    "Bilskatt",
    "---"
  ];

  //Control if the user has pressed "show more info" or not.
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

              //Build the list with either 15 or 9 items from the list depending on if user has pressed "show more info"
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: isExpanded == true ? 15 : 9,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildList(context, index);
                  })),

          //Expanded container to get last data to the bottom of the page
          Expanded(child: Container()),

          Container(
            padding: EdgeInsets.only(bottom: 24),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Text("Ska senast besiktas", style: _textStyle(1)),
                  Text("---", style: _textStyle(2)),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),

                    //Button that route to a page where user is booking a inspection on a specific car
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

  //Textstyling depending on the content of the text, either const text == value 1, text that is clickable == value 3 or else textstyle unique car data
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

  //Method to build a list through controlling when listview.builder is on a index where unique car data is needed
  Widget _buildList(BuildContext context, int index) {
    if ((index % 2 == 0) && (index < 8) ||
        ((index % 2 == 1) && index > 8) ||
        index == 8) {
      return _buildItems(context, index);
    } else {
      _refreshCarDetails(index);
      return _buildItems(context, index);
    }
  }

  //When unique car data is needed then this method is updating that data in listItem to that of the unique car that is currently picked by users
  _refreshCarDetails(index) {
    switch (index) {
      case 1:
        {
          listItem[index] = widget.car.regNr;
        }
        break;
      case 3:
        {
          //
        }
        break;
      case 5:
        {
          //
        }
        break;
      case 7:
        {
          //
        }
        break;
      case 10:
        {
          //
        }
        break;
      case 12:
        {
          //
        }
        break;
      case 14:
        {
          //
        }
        break;
    }
  }

  //Style every item depending on the content and also checking if clickable text is clicked on and call a rebuild of state
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
