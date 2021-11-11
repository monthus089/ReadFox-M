import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/Account.dart';
import 'package:flutter_application_1/page/dashboard.dart';
import 'package:flutter_application_1/page/setting.dart';
import 'package:flutter_application_1/page/store.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screen = [
    Dashboard(),
    Store(),
    Account(),
    Setting(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_cart,
          color: currentTab == 0 ? Colors.white : Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call_to_action_rounded,
                          color: currentTab == 0
                              ? Color(0xFFc52b32)
                              : Colors.black,
                        ),
                        Text(
                          'Library',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Color(0xFFc52b32)
                                  : Colors.black),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Store();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.storefront_outlined,
                          color: currentTab == 1
                              ? Color(0xFFc52b32)
                              : Colors.black,
                        ),
                        Text(
                          'Store',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Color(0xFFc52b32)
                                  : Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Account();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_box_outlined,
                          color: currentTab == 2
                              ? Color(0xFFc52b32)
                              : Colors.black,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Color(0xFFc52b32)
                                  : Colors.black),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3
                              ? Color(0xFFc52b32)
                              : Colors.black,
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Color(0xFFc52b32)
                                  : Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
