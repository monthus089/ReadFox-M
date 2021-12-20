import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List picked = [false, false, false];

  int totalAmount;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 259 * count;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
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
              ),
            ],
          ),
        ),
        Positioned(
          top: 150,
          child: Column(
            children: <Widget>[
              itemCard('assets/images/b7.png', 'Mushoku Tensei 7', 'gray',
                  '249', true, 0),
              itemCard('assets/images/b8.png', 'Mushoku Tensei 8', 'gray',
                  '249', true, 1),
              itemCard('assets/images/b9.png', 'Mushoku Tensei 9', 'gray',
                  '249', true, 2),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 50.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Total: ' + totalAmount.toString()),
                      SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text(
                            "Buy".toUpperCase(),
                            style: TextStyle(fontSize: 14),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ])),
    );
  }

  Widget itemCard(bookimge, bookName, color, price, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
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
                                        color: picked[i]
                                            ? Colors.red
                                            : Colors.grey.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                  )
                                : Container())),
                  ],
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 100.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(bookimge),
                    fit: BoxFit.contain,
                  )),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          bookName,
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        available
                            ? picked[i]
                                ? Text(
                                    'x1',
                                    style: GoogleFonts.openSans(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  )
                                : Container()
                            : Container()
                      ],
                    ),
                    SizedBox(width: 7.0),
                    available
                        ? Text(
                            'Color:',
                            style: GoogleFonts.openSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          )
                        // ignore: deprecated_member_use
                        : OutlineButton(
                            onPressed: () {},
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid),
                            child: Center(
                              child: Text('Find Similar',
                                  style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red)),
                            ),
                          ),
                    SizedBox(height: 7.0),
                    available
                        ? Text('\$' + price,
                            style: GoogleFonts.openSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFDD34A)))
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
