import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:flutter_application_1/models/popularbook_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                      'Library',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor),
                    ),
                    Text(
                      'My Library',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    )
                  ],
                )),
            Container(
              height: 39,
              margin: EdgeInsets.only(left: 25, right: 25, top: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightGreyColor),
              child: Stack(
                children: <Widget>[
                  TextField(
                    // ignore: deprecated_member_use
                    maxLengthEnforced: true,
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search Your Book...',
                        hintStyle: GoogleFonts.openSans(
                            fontSize: 12,
                            color: kGreyColor,
                            fontWeight: FontWeight.w600)),
                  ),
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset('assets/svg/background_search.svg'),
                  ),
                  Positioned(
                    top: 8,
                    right: 9,
                    child:
                        SvgPicture.asset('assets/icons/icon_search_white.svg'),
                  )
                ],
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: populars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('Click is ready');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 19),
                      height: 81,
                      width: MediaQuery.of(context).size.width - 50,
                      color: kBackgroundColor,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 81,
                            width: 57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(populars[index].image)),
                            ),
                          ),
                          SizedBox(
                            width: 21,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                populars[index].title,
                                style: GoogleFonts.openSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                populars[index].author,
                                style: GoogleFonts.openSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
