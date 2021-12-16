import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
                      'Cart',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor),
                    ),
                    Text(
                      'My Cart',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    )
                  ],
                )),
            Positioned(
              top: 150,
              child: Column(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemCard(bookimge, bookName, price, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          //pickToggle(i);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0, right: 10.0),
            width: MediaQuery.of(context).size.width - 20.0,
            height: 150.0,
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                          color: available
                              ? Colors.grey.withOpacity(0.4)
                              : Colors.red.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                        child: Center(
                            child: available
                                ? Container(
                                    height: 12.0,
                                    width: 12.0,
                                    decoration: BoxDecoration(
                                        color: bookName[i]
                                            ? Colors.yellow
                                            : Colors.grey.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                  )
                                : Container())),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
