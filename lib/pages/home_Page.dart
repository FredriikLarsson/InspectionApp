import 'package:flutter/material.dart';
import 'package:inspection_app/components/homePageCarList.dart';
import 'package:inspection_app/pages/addCar_Page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; //Which icon in bottomnavigationbar is currently active.


  //Different pages in the app.
  final List<Widget> _children = [
        HomePageCarList(),
        Container(),
        Container(),
        AddCarPage(),
        Container(),
      ];

  @override
  Widget build(BuildContext context) {
/*    final List<Widget> children = _children();*/

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
      ),

      body: _children[_currentIndex], //View a specific page from the _children list based on _currentIndex.

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.blue),
        child: BottomNavigationBar(
          onTap: onTabTapped, //onTap run function to rebuild another page
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Hem")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), title: Text("Konto")),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text("Sök")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box), title: Text("Lägg till")),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text("Meny")),
          ],
        ),
      ),
    );
  }

  //Calls for a rebuild of page with a changed _currentIndex that will bring another page in.
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
