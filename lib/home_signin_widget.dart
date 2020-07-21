import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSingINUP extends StatelessWidget {
  final Function goToSignUp;
  final Function goToSignIn;
  final Function goTovernum;


  /*
  goTovernum
    is for quick report .
    will be active after adding OTP.
   */

  HomeSingINUP({this.goToSignUp,this.goToSignIn,this.goTovernum});


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
            color: Colors.green,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign up",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 35.0,
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
            color: Colors.green,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Ask for help!",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        ),
        SizedBox(
          height: 30.0,
        ),
    InkWell(onTap: (){
    goToSignIn();
    },
    child: Text(
          "Already a member?  Sign in",
          style: TextStyle(
            color: Colors.black,
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
