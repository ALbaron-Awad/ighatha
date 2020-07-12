import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

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

  void _createUser({String email, String pw}) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pw).then((authResult)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Container(
          color: Colors.yellow,
          child: Text('Welcome ${authResult.user.email}'),
        );
      }));
    }).catchError((err){
      print(err.code);
      if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'This email already has an account associated with it'),
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
    return Form(
      key: formKey,
      child: Container(
      child: Column(
        children: <Widget>[
      Text(
        "crate login ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.4,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 20.0,),
      //email
      TextFormField(autovalidate: saveAttempted,
        onChanged: (textValue){
        setState(() {
          email = textValue ;
        });
      },
        validator: (emailValue){
          if(emailValue.isEmpty){
           return" this filed is manitor";
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
          errorStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
            hintText: "Enter email ",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)

            ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.4,
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
          errorStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "Enter password ",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)

          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.4,
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
          errorStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "Re- entet password ",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.4,
        ),
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
            "Cnacel",
            style: TextStyle(
              color: Colors.white,
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

          child: Text("create acount ",
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
