import 'package:flutter/material.dart';
import 'package:ighatha/HomeScreen.dart';
import 'package:ighatha/MyReports.dart';
import 'package:ighatha/myold.dart';
import 'package:ighatha/Profile.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch(_index) {
      case 0:
        child = HomePage();
        break;

      case 1:
        child = Reports();
        break;

      case 2:
        child = myold();
        break;

      case 3:
        child = Profile();
        break;
    }

    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: SizedBox.expand(child: child),
    );
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (int index) => setState(() => _index = index),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.red
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text("my Reports"),
            backgroundColor: Colors.blue
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_drop_down_circle),
            title: Text("My accomplishments"),
            backgroundColor: Colors.amberAccent
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            backgroundColor: Colors.black
        ),
      ],
    );
  }
}
