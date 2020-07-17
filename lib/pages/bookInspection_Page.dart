import 'package:flutter/material.dart';

class BookInspectionPage extends StatefulWidget {
  @override
  _BookInspectionPageState createState() => _BookInspectionPageState();
}

class _BookInspectionPageState extends State<BookInspectionPage> {

  //The current value that is picked in the dropdownmenu
  String dropDownValue = "Välj ett län";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
      ),
      body: Center(
        child: DropdownButton(
          style: TextStyle(color: Colors.blue),
          underline: Container(
            height: 2,
            color: Colors.blue,
          ),

          //Dropdownbutton is showing chosen value
          value: dropDownValue,
          items: <String>["Välj ett län", "Norrbotten", "Västerbotten"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),

          //If user change the value then this calls for a rebuild of page and changing dropDownValue to newValue
          onChanged: (String newValue) {
            setState(() {
              dropDownValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
