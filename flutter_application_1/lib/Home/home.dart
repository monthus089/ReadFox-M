import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/login.dart';
import 'package:flutter_application_1/Home/register.dart';
import 'package:flutter_application_1/constants/color_constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          //we will  give media query height
          //double.infinity make it big as my perent allows
          //while MediaQuery make it big as per the screen
          //width: double.infinity,
          //height: MediaQuery.of(context).size.height,

          child: Column(
            //even spce distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            //alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/icons/home_top.png",
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                  )),
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/logo.png"))),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 320,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: kBlackColor),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: 320,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    color: kRedColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/icons/home_bottom.png",
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
