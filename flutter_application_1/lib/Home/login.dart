import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/register.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:flutter_application_1/models/profrile.dart';
import 'package:flutter_application_1/navbar.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _secureText = true;
  Profile profile = Profile(username: '', email: '', password: '');
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          //  height: MediaQuery.of(context).size.height,
          //width: double.infinity,
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/icons/home_top.png",
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login to your account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/welcom.png"))),
          ),
          Container(
            child: Form(
                key: formkey,
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        emailFormField(),
                        SizedBox(
                          height: 20,
                        ),
                        passwordFormField()
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                        padding: EdgeInsets.only(top: 30, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: submitButton()),
                  )
                ])),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an account? "),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/icons/home_bottom.png",
              width: MediaQuery.of(context).size.width * 0.35,
            ),
          ),
        ],
      ))),
    );
  }

  Widget emailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            filled: true,
            labelText: "Email",
            hintStyle: TextStyle(color: kGreyColor),
            hintText: "Email",
            fillColor: Colors.white70),
        validator: MultiValidator([
          RequiredValidator(errorText: "กรุณากรอกEmail"),
          EmailValidator(errorText: "รูปแบบEmailไม่ถูกต้อง")
        ]),
        onSaved: (String email) {
          profile.email = email;
        });
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: _secureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock,
        ),
        suffixIcon: IconButton(
          icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _secureText = !_secureText;
            });
          },
        ),
        filled: true,
        hintStyle: TextStyle(color: kGreyColor),
        labelText: "Password",
        hintText: "Password",
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      validator: (value) {
        if (value.length == 0) {
          return 'กรุณากรอก Password';
        } else if (value.length < 8) {
          return 'รห้สผ่านต้องมีความยาว 8 ตัวอักษรขึ้นไป';
        } else if (!validatePassword(value)) {
          return 'รหัสไม่ถูกต้อง';
        }
        return null;
      },
      onSaved: (String password) {
        profile.password = password;
      },
    );
  }

  bool validatePassword(String value) {
    RegExp regExp = new RegExp(r"[a-z0-9A-Z]{8}");
    return (!regExp.hasMatch(value)) ? false : true;
  }

  MaterialButton submitButton() {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: () async {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          try {
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: profile.email, password: profile.password)
                .then((value) {
              formkey.currentState.reset();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return NavBar();
              }));
            });
          } on FirebaseAuthException catch (e) {
            Fluttertoast.showToast(
                msg: e.message, gravity: ToastGravity.BOTTOM);
          }
        }
      },
      color: kRedColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        "Login",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      ),
    );
  }
}
