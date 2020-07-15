import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspection_app/data/car.dart';
import 'package:inspection_app/data/dbHelper.dart';
import 'package:inspection_app/pages/home_Page.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  String regNr;
  String carName;
  var dbHelper;
  List<bool> _selections = List.generate(4, (_) => false);
  List<bool> _selectionsSecondRow = List.generate(4, (_) => false);
  int _carIconSelection = -1;

  final formKey = GlobalKey<FormState>();

  final myController =
      TextEditingController(); //Controller for checking textfield input
  final myControllerName = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    myControllerName.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Car c = Car(null, regNr, _carIconSelection);
      dbHelper.save(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  TextFormField(
                    controller: myController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Registreringsnummer",
                    ),
                    textAlign: TextAlign.center,
                    validator: (val) => val.length == 0 ? "Regnr saknas" : null,
                    onSaved: (val) => regNr = val,
                  ),
                  TextFormField(
                    controller: myControllerName,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(hintText: "Smeknamn (valfritt)"),
                    onSaved: (val) => carName = val,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(children: <Widget>[
                      Text("Välj gärna typ av bil"),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleButtons(
                        constraints:
                            BoxConstraints(minWidth: 60, minHeight: 60),
                        borderRadius: BorderRadius.circular(5),
                        children: <Widget>[
                          Icon(Icons.directions_car),
                          Icon(Icons.airport_shuttle),
                          Icon(Icons.directions_bus),
                          Icon(Icons.local_shipping),
                        ],
                        isSelected: _selections,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _selections.length; i++) {
                              if (i == index) {
                                _selections[i] = !_selections[i];
                                _selectionsSecondRow[i] = false;
                              } else {
                                _selections[i] = false;
                                _selectionsSecondRow[i] = false;
                              }
                            }
                            _selections[index]
                                ? _carIconSelection = index
                                : _carIconSelection = -1;
                          });
                        },
                      ),
                      ToggleButtons(
                        constraints:
                            BoxConstraints(minWidth: 60, minHeight: 60),
                        borderRadius: BorderRadius.circular(5),
                        children: <Widget>[
                          Icon(Icons.motorcycle),
                          Icon(Icons.local_car_wash),
                          Icon(Icons.train),
                          Icon(Icons.directions_bike)
                        ],
                        isSelected: _selectionsSecondRow,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0;
                                i < _selectionsSecondRow.length;
                                i++) {
                              if (i == index) {
                                _selectionsSecondRow[i] =
                                    !_selectionsSecondRow[i];
                                _selections[i] = false;
                              } else {
                                _selectionsSecondRow[i] = false;
                                _selections[i] = false;
                              }
                            }
                            _selectionsSecondRow[index]
                                ? _carIconSelection = index + 4
                                : _carIconSelection = -1;
                          });
                        },
                      ),
                    ]),
                  ),
                  _buildButton(),
                ],
              ),
            )));
  }

  _buildButton() {
    return Container(
      constraints: BoxConstraints(maxWidth: double.infinity, minHeight: 120),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
            onPressed: () {
              validate();
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
                ))),
      ),
    );
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
