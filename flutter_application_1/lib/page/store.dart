import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/bookmodel.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
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
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            height: 20,
                          ),
                        ),
                        CarouselSlider.builder(
                            height: 350,
                            viewportFraction: .48,
                            enableInfiniteScroll: true,
                            itemCount: book.length - 5,
                            realPage: 0,
                            itemBuilder: (BuildContext context, int index) {
                              Book books = book[index];
                              return Container(
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 230,
                                      width: 150,
                                      child: Image.asset(
                                        books.imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    SizedBox(height: 13),
                                    Text(books.title),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(books.author)
                                  ],
                                ),
                              );
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'New',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
