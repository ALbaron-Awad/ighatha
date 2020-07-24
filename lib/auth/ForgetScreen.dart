import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgetScreen();
  }}

class _ForgetScreen  extends State<ForgetScreen>{
  String email;
  var _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _ForgetPassword({String email}) {
    _auth.sendPasswordResetEmail(email: email)
        .then((value) {
      showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Password Reset'),
          content: Text('A link to reset your password has been sent to  ${email}'),
          contentTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 15.4,
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
    ).catchError((err){
      print(err.code);
      if (err.code == 'ERROR_INVALID_EMAIL') {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Email'),
            content: Text(
                'This is not a valid email'),
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
      } if (err.code == 'ERROR_USER_NOT_FOUND') {
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
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1.0),
      appBar: AppBar(
        title: Text("Forget the Password",

      style: TextStyle(
        color: Colors.black,
        backgroundColor: Colors.white,
      ),
      ),
      ),
      body: Center(

        child: Padding(
          padding: EdgeInsets.only(top: 50 , left: 20 , right: 20),

        child:Form(
    key: _formKey,

        child:Column(
          children: <Widget>[
            Text("Enter your email",
              style: TextStyle(
                color: Colors.black,
                fontSize:  22 ,
              ),
            ),
            SizedBox(height: 35.0,),
            Theme(
              data: ThemeData(
                hintColor: Colors.black45
              ),
              child: Padding(padding:
              EdgeInsets.only(top: 30),
              child: TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "Places enter your email ";
                  }else{
                    email = value ;
                  }
                  return null ;
                },
                style: TextStyle(color: Colors.blue),
                decoration:  InputDecoration(
                  labelText:  "Email",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black , width: 6.0),
                  ),
                  disabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.green),
                  ),focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green),
                ),
                ),
              ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20),
              child: RaisedButton(
                onPressed: () {
                    if(_formKey.currentState.validate()){
                      _ForgetPassword(email: email);
               }
                },
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
    ),
    color: Colors.white,
    child: Text("Send email", style:
    TextStyle(color:  Colors.blue,
    fontSize: 23,fontWeight: FontWeight.bold,),),
    padding:  EdgeInsets.all(10),
              )
            )
          ],
        ),
        ),
      ),
      ),
    );
  }
}
