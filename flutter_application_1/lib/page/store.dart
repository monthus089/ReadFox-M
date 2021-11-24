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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 440,
              child: Stack(
                children: [
                  Container(
                    height: 305,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(300, 300),
                        bottomRight: Radius.elliptical(300, 300),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
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
                                    color: Colors.white, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        CarouselSlider.builder(
                          height: 334,
                          viewportFraction: .48,
                          enlargeCenterPage: true,
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
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      image: DecorationImage(image:AssetImage(books.imageUrl),
                                      fit: BoxFit.cover
                                      ),
                                    ),
                                    ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(books.title),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(books.author)
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Bestsellers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //  color: Colors.red,
              height: 210,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    Book books = book[index + 2];
                    return Container(
                      width: 150,
                      height: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            width: 100,
                            child: Image.asset(
                              books.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            books.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'by ${books.author}',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Recently Viewed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //  color: Colors.red,
              height: 210,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  Book books = book[index + 5];
                  return Container(
                    width: 150,
                    height: 210,
                    //  color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          width: 100,
                          child: Image.asset(
                            books.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          books.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'by ${books.author}',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
