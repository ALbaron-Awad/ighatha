import 'package:flutter/material.dart';
import 'package:ighatha/home_widget.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile();
  }}

class _Profile  extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1.0),
      appBar: AppBar(
        title: Text("_Profile",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
