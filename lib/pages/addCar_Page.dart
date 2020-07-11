import 'package:flutter/material.dart';
import 'package:inspection_app/components/addCarGridList.dart';
import 'package:inspection_app/pages/home_Page.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final myController = TextEditingController(); //Controller for checking textfield input

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            TextField(
              controller: myController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Registreringsnummer",
              ),
              onSubmitted: (value) {},
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Smeknamn (valfritt)",
              ),
            ),

            //Calls a widget to build the gridlist with vehicletypes
            AddCarGridList(),

            //Build a button to add a new car to the list on homepage
            Container(
                padding: EdgeInsets.only(top: 65.0),
                child: RaisedButton(
                    onPressed: () {
                      _showDialog();
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
                          "Lägg till valt fordon",
                          style: TextStyle(fontSize: 17),
                        ))))
          ]),
        ));
  }

  //Show a dialog box when user press button to add another car
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Text(
              "Klart!",
              style: TextStyle(color: Colors.green),
            ),
            content: Text("Vill du lägga till fler fordon?"),
            actions: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.green,
                child: Text("Ja"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  "Nej",
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          );
        });
  }
  }
