import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/login.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:flutter_application_1/models/profrile.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String passwordcheck = "";
  Profile profile = Profile(username: '', email: '', password: '');
  final formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  bool _secureText1 = true;
  bool _secureText2 = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: kWhiteColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: kWhiteColor,
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
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Column(children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/icons/logo.png"))),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Create an account, It's free",
                          style: TextStyle(fontSize: 15, color: kGreyColor),
                        )
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Form(
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 320,
                                child: usernameFormField(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 320,
                                child: emailFormField(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              passwordFormField(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(children: <Widget>[
                        Container(
                          child: signupButton(),
                        )
                      ]),
                      SizedBox(
                        height: 20,
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Widget usernameFormField() {
    return TextFormField(
      decoration: InputDecoration(
          focusColor: Colors.red,
          prefixIcon: Icon(Icons.account_circle_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          filled: true,
          labelText: "UserName",
          hintStyle: TextStyle(color: kGreyColor),
          hintText: "UserName",
          fillColor: Colors.white70),
      validator: RequiredValidator(errorText: "กรุณากรอกUserName"),
      onSaved: (String username) {
        profile.username = username;
      },
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
    return Container(
        width: 320,
        child: Column(
          children: <Widget>[
            TextFormField(
              obscureText: _secureText1,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secureText1 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _secureText1 = !_secureText1;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  filled: true,
                  labelText: "Password",
                  hintStyle: TextStyle(color: kGreyColor),
                  hintText: "Password",
                  fillColor: Colors.white70),
              validator: (value) {
                if (value.length == 0) {
                  return 'กรุณากรอก Password';
                } else if (value.length < 8) {
                  return 'รห้สผ่านต้องมีความยาว 8 ตัวอักษรขึ้นไป';
                } else if (!validatePassword(value)) {
                  return 'รหัสไม่ถูกต้อง';
                }
                passwordcheck = value;
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: _secureText2,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secureText2 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _secureText2 = !_secureText2;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  filled: true,
                  labelText: "ConfirmPassword",
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "ConfirmPassword",
                  fillColor: Colors.white70),
              validator: (String value) {
                if (value != passwordcheck) {
                  return 'รหัสผ่านไม่ตรงกัน!';
                }
                return null;
              },
              onSaved: (String pass) {
                profile.password = pass;
              },
            )
          ],
        ));
  }

  bool validatePassword(String value) {
    RegExp regExp = new RegExp(r"[a-z0-9A-Z]{8}");
    return (!regExp.hasMatch(value)) ? false : true;
  }

  MaterialButton signupButton() {
    return MaterialButton(
      minWidth: 320,
      height: 60,
      onPressed: () async {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          try {
            await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: profile.email, password: profile.password)
                .then((value) {
              formkey.currentState.reset();
              Fluttertoast.showToast(
                  msg: "สร้างบัญชีผู้ใช้สำเร็จ", gravity: ToastGravity.BOTTOM);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            });
          } on FirebaseAuthException catch (e) {
            String message = "";
            if (e.code == "email-already-in-use") {
              message = "อีเมลนี้ถูกใช้แล้ว กรุณาใช้อีเมลอื่นแทน";
            }
            Fluttertoast.showToast(msg: message, gravity: ToastGravity.BOTTOM);
          }
        }
      },
      color: kRedColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        "Sign Up",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: kWhiteColor),
      ),
    );
  }
}
