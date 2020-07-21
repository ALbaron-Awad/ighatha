import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'HomePage.dart';
import 'ForgetScreen.dart';
class Login extends StatefulWidget {

  final Function cancelBackToHome;

  Login({this.cancelBackToHome});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, passwordConfirm ;
  bool _termsAgreed = false ;
  bool saveAttempted = false;
  final formKey = GlobalKey<FormState>();

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  void _createUser({String email, String pw}) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pw).then((authResult)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return
          Container(
          color: Colors.yellow,
          child: Text('Welcome ${authResult.user.email}'),
        );
      }));

    }).catchError((err){
      print(err.code);
      if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Email'),
            content: Text(
                'This email already has an account associated with it'),
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
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Create an account!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.4,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25.0,),
            //email
            TextFormField(autovalidate: saveAttempted,
              onChanged: (textValue){
                setState(() {
                  email = textValue ;
                });
              },
              validator: (emailValue){
                if(emailValue.isEmpty){
                  return" this filed is monitor";
                }
                if(emailValue== "ERROR_INVALID_EMAIL"){
                  return"This is not a valid email";
                }
                String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                    "\\@" +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                    "(" +
                    "\\." +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                    ")+";
                RegExp regExp = new RegExp(p);

                if (regExp.hasMatch(emailValue)) {
                  // So, the email is valid
                  return null;
                }
                return 'This is not a valid email';
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                hintText: "Enter email ",
                hintStyle: TextStyle(color: Colors.black45,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.4,
              ),
            ),
            SizedBox(height: 20.0,),
            //pass
            TextFormField(autovalidate: saveAttempted,
              onChanged: (textValue){
                setState(() {
                  password = textValue ;
                });
              },
              validator: (passwordValue){
                if(passwordValue.isEmpty){
                  return" this filed is mandatory";
                }
                if(passwordValue.length < 8){
                  return " password must be at least 8 characters";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                hintText: "Enter password ",
                hintStyle: TextStyle(color: Colors.black45,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.4,
              ),
            ),
            SizedBox(height: 20.0,),
            //pass conf
            TextFormField(
              autovalidate: saveAttempted,
              onChanged: (textValue) {
                setState(() {
                  passwordConfirm = textValue;
                });
              },
              validator: (passwordConfirm) {
                if(passwordConfirm.isEmpty){
                  return" this filed is mandatory";
                }
                if (passwordConfirm != password) {
                  return 'Passwords must match';

                }

                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                hintText: "Re-enter password ",
                hintStyle: TextStyle(color: Colors.black45,
                  fontSize: 20,
                ),
              ),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.4,
                )
            ),
            SizedBox(height: 20.0,),

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(onTap: (){
                  widget.cancelBackToHome();
                },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                InkWell(onTap: (){
                  saveAttempted = true ;
                  if(formKey.currentState.validate()){
                    formKey.currentState.save();
                    _createUser(email: email , pw:  password);
                  }
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

                    child: Text("Create account",
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
          ],),
      ),
    );
  }
}
