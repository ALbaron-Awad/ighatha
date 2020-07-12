import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email , password ;

  void _signIn({String em , String pw}){
    _auth.signInWithEmailAndPassword(email: em, password: pw).then((authResult){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Container(
          color: Colors.yellow,
          child: Text('Welcome ${authResult.user.email}'),
        );
      }));
    }).catchError((err){
      print(err.code);
      if (err.code == 'ERROR_WRONG_PASSWORD') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'wrong password !! '),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: <Widget>[
      Text(
        "Sign In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.4,
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
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "entet email ",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.4,
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
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "entet password ",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)

          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.4,
        ),
      ),
      SizedBox(height: 20.0,),
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
            child: Text("Log in  ",
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

      Text(
        "Forger password  ?  ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      SizedBox(height: 50.0,),
    ],),
    );
  }
}