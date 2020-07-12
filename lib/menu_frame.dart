import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ighatha/home_signin_widget.dart';
import 'package:ighatha/login.dart';
import 'package:ighatha/sign_in.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 28.0, vertical:  30.0),
            child: Column(
              children: <Widget>[
                Icon(FontAwesomeIcons.heartBroken,
                  color: Color.fromRGBO(246, 29, 24, 1.0),
                  size: 60.0,
                ),
                Text("find my",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                  ),
                ),
                SizedBox(
                  height: 90.0,
                ),
                Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: <Widget>[
                    HomeSinginW(goToSignIn: (){
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
              Color.fromRGBO(255, 123, 67, 1.0),
              Color.fromRGBO(245, 50, 111, 1.0),
            ],
          ),
        ),
      ),
    );
  }
}
