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
                            right: 50,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_atm,
                                  color: kRedColor,
                                  size: 30,
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
                                  width: 20,
                                ),
                                cashs()
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
<<<<<<< HEAD
=======
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.description,
                          size: 40,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Version',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '1.0.1',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.portrait,
                          size: 40,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.description,
                          size: 40,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Version',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '1.0.1',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        )
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.portrait,
                          size: 40,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
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
>>>>>>> 7afdafa47e619318fa7c253152e8498094194531
                    Align(
                      child: logout(),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  MaterialButton cashs() {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: kRedColor,
      child: Text(
        "เติมเงิน",
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
      ),
    );
  }

  MaterialButton logout() {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ออกจากระบบ'),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Text(
        "Log Out",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: kBlackColor),
      ),
    );
  }
}
