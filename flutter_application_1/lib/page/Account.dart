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
  int cash = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25, right: 25),
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
                    Stack(
                      children: [
                        Positioned(
                            child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("assets/icons/welcom.png"),
                            ),
                          ],
                        )),
                        Positioned(
                            top: 10,
                            right: 30,
                            child: Row(
                              children: [
                                Text(
                                  auth.currentUser.email.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )),
                        Positioned(
                            top: 45,
                            right: 90,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/money.png",
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  cash.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'เติมเงิน',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: logout(),
                    ),
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
      color: kRedColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        "Log Out",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      ),
    );
  }
}
