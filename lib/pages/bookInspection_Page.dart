import 'package:flutter/material.dart';

class BookInspectionPage extends StatefulWidget {
  @override
  _BookInspectionPageState createState() => _BookInspectionPageState();
}

class _BookInspectionPageState extends State<BookInspectionPage> {
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
          value: dropDownValue,
          items: <String>["Välj ett län", "Norrbotten", "Västerbotten"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
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
