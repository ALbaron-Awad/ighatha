import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ighatha/auth/menu_frame.dart';
import 'package:location/location.dart';
void main() {
  runApp(MyHomePage());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:MenuFrame(),
    );
}
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

class _MyHomePageState  extends State<MyHomePage>{

  bool _serviceEnabled;

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
      home:MyApp(),
    );
  }

   Future<void> checkLocationServicesInDevice()
   async {
      Location location = new Location();
      _serviceEnabled =  await location.serviceEnabled();

      if(_serviceEnabled) {
        print("Gps on");
      }else{
        _serviceEnabled =  await location.requestService();
        if(_serviceEnabled)
          {
            print("track on ");

          }else{
          SystemNavigator.pop();
        }
      }
    }
  }
