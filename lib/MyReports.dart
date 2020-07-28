import 'package:flutter/material.dart';
import 'package:ighatha/home_widget.dart';

class Reports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Reports();
  }}

class _Reports  extends State<Reports>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1.0),
      appBar: AppBar(
        title: Text("my reports",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
