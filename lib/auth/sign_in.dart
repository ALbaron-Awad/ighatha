import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ighatha/auth/ForgetScreen.dart';
import 'package:ighatha/home_widget.dart';
class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email , password ;

  void _signIn({String em , String pw}){
    _auth.signInWithEmailAndPassword(email: em, password: pw)
    .then((authResult){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:(BuildContext context)=> MyHomePage()));
    }).catchError((err){
      print(err.code);
      if (err.code == 'ERROR_WRONG_PASSWORD') {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Password '),
            content: Text(
                'Wrong Password !'),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.4,
              fontWeight: FontWeight.w600,
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: new Text('Ok'),
              ),
            ],
          ),
        );
      }

      if (err.code== 'ERROR_USER_NOT_FOUND') {
         showDialog(
            context: context,
            builder: (context) => new AlertDialog(
          title: new Text('Email'),
          content: Text(
              'this email not registered !'),
          contentTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.4,
            fontWeight: FontWeight.w600,
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(); // dismisses only the dialog and returns nothing
              },
              child: new Text('Ok'),
            ),
          ],
        ),
      );
      }
      if (err.code== 'ERROR_INVALID_EMAIL') {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Email'),
            content: Text(
                'This is not a valid email !'),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.4,
              fontWeight: FontWeight.w600,
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: new Text('Ok'),
              ),
            ],
          ),
        );
      }if (err.code== 'ERROR_TOO_MANY_REQUESTS') {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Email'),
            content: Text(
                'You have reached the upper limit for attempts. Please try again later !'),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.4,
              fontWeight: FontWeight.w600,
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: new Text('Ok'),
              ),
            ],
          ),
        );
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: <Widget>[
      Text(
        "Sign In",
        style: TextStyle(
          color: Colors.black,
          fontSize: 22.4,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 20.0,),
      TextField(
        onChanged: (textValue){
          setState(() {
            email = textValue;
          });
        },
        style: TextStyle(color: Colors.blue),
        decoration:  InputDecoration(
          labelText:  "Email",
          labelStyle: TextStyle(
              color: Colors.black45
          ),
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue , width: 6.0),
          ),
          disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
      SizedBox(height: 20.0,),
      TextField(
        onChanged: (textValue){
          setState(() {
            password = textValue;
          });
        },
        obscureText: true,
        style: TextStyle(color: Colors.blue),
        decoration:  InputDecoration(
          labelText:  "Password",
          labelStyle: TextStyle(
              color: Colors.black45
          ),
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue , width: 6.0),
          ),
          disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green),
        ),
        ),
      ),
      //forget password
      SizedBox(height: 20.0,),
      Padding(padding: EdgeInsets.only(right: 20),
      child: Container(
        width: double.infinity,
       child: InkWell(
         onTap: (){
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder:(BuildContext context)=> ForgetScreen()));
         },
         child:Text(
           "Forget password ?  ",
           style: TextStyle(
             color: Colors.black,
             fontSize: 15.0,
           ),
           textAlign: TextAlign.right,
         ),
       ),
      ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 60.0,
            height: 150,
          ),
          InkWell(onTap: (){
            _signIn(em: email , pw:  password);
          },
          child:Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 34.7,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0
              ),
            ),
            child: Text(" Log in ",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 23.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
    ),
        ],
      ),

      SizedBox(height: 5.0,),
      /*
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child:Text(
            "Forger password  ?  ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
      */
    ],),
    );
  }
}