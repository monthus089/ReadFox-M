import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constant.dart';
import 'package:flutter_application_1/models/newbook_model.dart';
import 'package:flutter_application_1/models/popularbook_model.dart';
import 'package:flutter_application_1/page/selected_book_screen.dart';
import 'package:flutter_application_1/widgets/custom_Tab_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
                      'Store',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor),
                    ),
                    Text(
                      'ReadFox Store',
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
                        hintText: 'Search...',
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
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  labelColor: kBlackColor,
                  unselectedLabelColor: kGreyColor,
                  labelStyle: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w700),
                  unselectedLabelStyle: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  indicator: RoundedRectangleTabIndicator(
                      weight: 2, width: 30, color: kBlackColor),
                  tabs: [
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('New'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Manga'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Novel'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 22),
              height: 210,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 25, right: 6),
                  itemCount: newbooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedBookScreen(
                                      popularBookModel: populars[index],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 19),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: 138,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(populars[index].image)),
                                  color: kMainColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 5),
              child: Text(
                'Books',
                style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedBookScreen(
                                  popularBookModel: populars[index],
                                )),
                      );
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
                            width: 62,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(populars[index].image)),
                                color: kMainColor),
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                populars[index].price,
                                style: GoogleFonts.openSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor),
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
