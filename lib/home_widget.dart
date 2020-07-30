import 'package:flutter/material.dart';
import 'package:ighatha/HomeScreen.dart';
import 'package:ighatha/MyReports.dart';
import 'package:ighatha/myold.dart';
import 'package:ighatha/Profile.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
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


class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState  extends State<MyHomePage>{

  bool _serviceEnabled;

  PermissionStatus _permissionGranted;

  LocationData _location;

  @override
  void initState() {

    super.initState();
    checkLocationServicesInDevice();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gps most be on !',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:MyStatefulWidget(),
    );
  }
  Future<void> checkLocationServicesInDevice() async {

    Location location = new Location();

    _serviceEnabled = await location.serviceEnabled();

    if(_serviceEnabled)
    {

      _permissionGranted = await location.hasPermission();

      if(_permissionGranted == PermissionStatus.granted)
      {

        _location = await location.getLocation();

        print(_location.latitude.toString() + " " + _location.longitude.toString());

      }else{

        _permissionGranted = await location.requestPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {

          print('user allowed');

        }else{

          SystemNavigator.pop();

        }
      }
    }else{

      _serviceEnabled = await location.requestService();

      if(_serviceEnabled)
      {

        _permissionGranted = await location.hasPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {

          print('user allowed before');

        }else{

          _permissionGranted = await location.requestPermission();

          if(_permissionGranted == PermissionStatus.granted)
          {

            print('user allowed');

          }else{

            SystemNavigator.pop();

          }
        }
      }else{

        SystemNavigator.pop();

      }
    }
  }
}