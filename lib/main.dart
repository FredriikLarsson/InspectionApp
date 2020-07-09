import 'package:flutter/material.dart';
import 'package:inspection_app/pages/home_Page.dart';

void main() => runApp(InspectionApp());

class InspectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "InspectionApp",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
