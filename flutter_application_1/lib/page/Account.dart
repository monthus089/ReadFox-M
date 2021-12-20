import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/home.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:flutter_application_1/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final auth = FirebaseAuth.instance;

  int _cash = 90;
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
                                  '$_cash',
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
                    Align(
                      child: logout(),
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
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                    height: 500,
                    child:
                        ListView(physics: BouncingScrollPhysics(), children: <
                            Widget>[
                      Padding(
                          padding:
                              EdgeInsets.only(left: 25, top: 25, right: 25),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: [
                                    Positioned(
                                        top: 10,
                                        left: 80,
                                        child: Text(
                                          'เติมเงิน',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            size: 35,
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_atm,
                                      color: kRedColor,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      ' 90',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: kRedColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    MaterialButton(
                                      color: kRedColor,
                                      minWidth: 80,
                                      height: 30,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Text('ยืนยันการเติมเงิน'),
                                                content: Text(
                                                    'คุณแน่ใจนะว่าต้องการเติมเงินเป็นจำนวน 90 บาท'),
                                                actions: <Widget>[
                                                  MaterialButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _cash += 90;
                                                        });
                                                        print(_cash);
                                                        Navigator.pop(context);
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
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                        " 90 บาท",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_atm,
                                      color: kRedColor,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '150',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: kRedColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    MaterialButton(
                                      color: kRedColor,
                                      minWidth: 40,
                                      height: 30,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Text('ยืนยันการเติมเงิน'),
                                                content: Text(
                                                    'คุณแน่ใจนะว่าต้องการเติมเงินเป็นจำนวน 150 บาท'),
                                                actions: <Widget>[
                                                  MaterialButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _cash += 150;
                                                        });
                                                        print(_cash);
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
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
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                        "150 บาท",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_atm,
                                      color: kRedColor,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '300',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: kRedColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    MaterialButton(
                                      color: kRedColor,
                                      minWidth: 40,
                                      height: 30,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Text('ยืนยันการเติมเงิน'),
                                                content: Text(
                                                    'คุณแน่ใจนะว่าต้องการเติมเงินเป็นจำนวน 300 บาท'),
                                                actions: <Widget>[
                                                  MaterialButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _cash += 300;
                                                        });
                                                        print(_cash);
                                                        Navigator.pop(context);
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
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                        "300 บาท",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_atm,
                                      color: kRedColor,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '500',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: kRedColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    MaterialButton(
                                      color: kRedColor,
                                      minWidth: 40,
                                      height: 30,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Text('ยืนยันการเติมเงิน'),
                                                content: Text(
                                                    'คุณแน่ใจนะว่าต้องการเติมเงินเป็นจำนวน 500 บาท'),
                                                actions: <Widget>[
                                                  MaterialButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _cash += 500;
                                                        });
                                                        print(_cash);
                                                        Navigator.pop(context);
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
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Text(
                                        "500 บาท",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
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
                              ]))
                    ])),
              );
            });
      },
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
      color: kRedColor,
      minWidth: 200,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        "Log Out",
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      ),
    );
  }
}
