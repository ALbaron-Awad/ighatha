import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSinginW extends StatelessWidget {
  final Function goToSignUp;
  final Function goToSignIn;
  final Function goTovernum;

  HomeSinginW({this.goToSignUp,this.goToSignIn,this.goTovernum});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 70.0,
        horizontal: 24.0,
      ),
    child: Column(
      children: <Widget>[
        InkWell(onTap: (){
          goToSignUp();
    },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 29.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "sign uP ",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 40.0,
        ),
        InkWell(onTap: (){
        goTovernum();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 29.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ASk for help !",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 20.0,
        ),
    InkWell(onTap: (){
    goToSignIn();
    },
    child: Text(
          "AREADy a member  ?  Sign in ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
    ),
      ],
    )

      );
  }
}
