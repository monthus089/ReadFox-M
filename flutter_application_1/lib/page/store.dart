import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200, 200),
                    bottomRight: Radius.elliptical(300, 300))),
            child: Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(300, 300),
                          bottomRight: Radius.elliptical(300, 300))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Store',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ^ top bar //
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      CarouselSlider.builder(
                          viewportFraction: .5,
                          enableInfiniteScroll: true,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int itemIndex) =>
                              Container(
                                width: 130,
                                color: Colors.blue,
                              ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
