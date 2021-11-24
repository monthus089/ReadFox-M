import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/car.png')),
              title: Text(
                "This is a Car,because it's a car.So,it's a car. This is a Car,because it's a car.So,it's a car. This is a Car,because it's a car.So,it's a car. This is a Car,because it's a car.So,it's a car.",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/bicycle.png')),
              title: Text(
                "This is a Bicycle,because it's a Bicycle.So,it's a Bicycle This is a Bicycle,because it's a Bicycle.So,it's a Bicycle This is a Bicycle,because it's a Bicycle.So,it's a Bicycle",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/boat.png')),
              title: Text(
                "This is a Boat,because it's a Boat.So,it's a Boat",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/bus.png')),
              title: Text(
                "This is a Bus,because it's a Bus.So,it's a Bus",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/train.png')),
              title: Text(
                "This is a Train,because it's a Train.So,it's a Train",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/walk.png')),
              title: Text(
                "This is a Walk,because it's a Walk.So,it's a Walk",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
