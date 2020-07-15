import 'package:flutter/material.dart';
import 'package:inspection_app/pages/addCar_Page.dart';

class AddCarGridList extends StatefulWidget {
  @override
  _AddCarGridListState createState() => _AddCarGridListState();
}

class _AddCarGridListState extends State<AddCarGridList> {
  int _carIndex = -1; //Keep track which vehicletype box is currently active(being used by user)

  List<bool> _selections = List.generate(4, (_) => false);
  List<bool> _selectionsSecondRow = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: <Widget> [
          Text("Välj gärna typ av bil"),
        SizedBox(height: 10,),
        ToggleButtons(
          constraints: BoxConstraints(minWidth: 60, minHeight: 60),
          borderRadius: BorderRadius.circular(5),
          children: <Widget> [
            Icon(Icons.airport_shuttle),
            Icon(Icons.directions_bus),
            Icon(Icons.directions_car),
            Icon(Icons.directions_bus),
          ],
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              for (int i = 0;i < _selections.length;i++) {
                if (i == index) {
                  _selections[i] = !_selections[i];
                  _selectionsSecondRow[i] = false;
                } else {
                  _selections[i] = false;
                  _selectionsSecondRow[i] = false;
                }
              }
            }
            );
            },
        ),
          ToggleButtons(
            constraints: BoxConstraints(minWidth: 60, minHeight: 60),
            borderRadius: BorderRadius.circular(5),
            children: <Widget> [
              Icon(Icons.airport_shuttle),
              Icon(Icons.directions_bus),
              Icon(Icons.directions_car),
              Icon(Icons.directions_bus),
            ],
            isSelected: _selectionsSecondRow,
            onPressed: (int index) {
              setState(() {
                for (int i = 0;i < _selectionsSecondRow.length;i++) {
                  if (i == index) {
                    _selectionsSecondRow[i] = !_selectionsSecondRow[i];
                    _selections[i] = false;
                  } else {
                    _selectionsSecondRow[i] = false;
                    _selections[i] = false;
                  }
                }
              });
            },
          ),
      ]
      ),
    );

















    /*Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[

              //Text above the gridview
          Text(
            "Välj gärna typ av bil",
            textAlign: TextAlign.start,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 4,
                ),
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 0) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 0);
                            }
                          },
                          child: _buildWidget(Icons.drive_eta, 0))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 1) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 1);
                            }
                          },
                          child: _buildWidget(Icons.airport_shuttle, 1))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 2) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 2);
                            }
                          },
                          child: _buildWidget(Icons.motorcycle, 2))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 3) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 3);
                            }
                          },
                          child: _buildWidget(Icons.local_shipping, 3))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 4) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 4);
                            }
                          },
                          child: _buildWidget(Icons.directions_bus, 4))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 5) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 5);
                            }
                          },
                          child: _buildWidget(Icons.drive_eta, 5))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 6) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 6);
                            }
                          },
                          child: _buildWidget(Icons.drive_eta, 6))),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.3))),
                      child: GestureDetector(
                          onTap: () {
                            if (_carIndex == 7) {
                              setState(() => _carIndex = -1);
                            } else {
                              setState(() => _carIndex = 7);
                            }
                          },
                          child: _buildWidget(Icons.drive_eta, 7))),
                ],
              ))
        ]));*/
  }

/*  //Method to check if a box is currently active and color it accordingly
  Widget _buildWidget(IconData icon, int index) {
    bool isSelected = _carIndex == index;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              isSelected == true ? Colors.grey.withOpacity(0.5) : Colors.white,
        ),
        child: Icon(icon));
  }*/


}
