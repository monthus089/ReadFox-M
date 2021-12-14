import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/home.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Account',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor),
                    ),
                    Text(
                      'My Account',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/welcom.png"))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          auth.currentUser.email.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: logout(),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  MaterialButton logout() {
    return MaterialButton(
      minWidth: 200,
      height: 60,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('อกกจากระบบ'),
                content: Text('คุณแน่ใจนะว่าต้องการออกจากระบบ'),
                actions: <Widget>[
                  MaterialButton(
                      onPressed: () {
                        auth.signOut().then((value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        });
                      },
                      child: Text('ยืนยัน')),
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('ยกเลิก'))
                ],
              );
            });
      },
      color: Color(0xffEE5A66),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        "LogOut",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      ),
    );
  }
}
