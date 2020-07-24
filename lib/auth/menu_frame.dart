import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ighatha/auth/home_signin_widget.dart';
import 'package:ighatha/auth/login.dart';
import 'package:ighatha/auth/sign_in.dart';

class MenuFrame extends StatelessWidget {
  PageController pageController = PageController();
  Duration _animathionDruation = Duration(microseconds: 500);

  void _changePage(int page){
    pageController.animateToPage(page,
        duration: _animathionDruation,
        curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical:  12.0),
            child: Column(
              children: <Widget>[
               Image.asset("assets/images/icon.png"),
                SizedBox(
                  height: 80.0,
                ),
                Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: <Widget>[
                    HomeSingINUP(goToSignIn: (){
                      pageController.animateToPage(1,
                          duration: Duration(microseconds: 200),
                          curve: Curves.easeIn);
                    },
                      goToSignUp: (){
                        pageController.animateToPage(2,
                            duration: Duration(microseconds: 200),
                            curve: Curves.easeIn);
                      },
                    ),
                    SignIn(),

                    Login(cancelBackToHome: (){
                      pageController.animateToPage(0,
                          duration: Duration(microseconds: 200),
                          curve: Curves.easeIn);
                    },),
                ],),),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(235, 235, 235, 1.0),
              Color.fromRGBO(235, 235, 235, 1.0),
            ],
          ),
        ),
      ),
    );
  }
}
