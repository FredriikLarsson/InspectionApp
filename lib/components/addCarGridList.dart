/*import 'package:flutter/material.dart';
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
  }
}*/
