import 'package:flutter/material.dart';
import 'package:ighatha/home_widget.dart';

class myold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _old();
  }}

class _old  extends State<myold>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 235, 1, 1.0),
      appBar: AppBar(
        title: Text("olllllld",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
