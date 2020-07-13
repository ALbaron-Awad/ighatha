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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Forget the password",
      style: TextStyle(
        color: Colors.pink,
        backgroundColor: Colors.white,
      ),
      ),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50 , left: 20 , right: 20),

        child:Form(
    key: _formKey,

        child:Column(
          children: <Widget>[
            Text("check you eamil  ",
              style: TextStyle(
                color: Colors.amber,
                fontSize:  20 ,
              ),
            ),
            Theme(
              data: ThemeData(
                hintColor: Colors.blue
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
                style: TextStyle(color: Colors.red),
                decoration:  InputDecoration(
                  labelText:  "Email",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  disabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 , right: 20),
              child: RaisedButton(
                onPressed: () {
                    if(_formKey.currentState.validate()){
                      FirebaseAuth.instance.sendPasswordResetEmail(email: email).
                then((value) => print("check your email "));
               }
                },
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
    ),
    color: Color(0xffff2fc3),
    child: Text("Send email", style:
    TextStyle(color:  Colors.blue,
    fontSize: 20,fontWeight: FontWeight.bold,),),
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
