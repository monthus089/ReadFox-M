import 'package:flutter/material.dart';
import 'page/account.dart';
import 'page/cart.dart';
import 'page/library.dart';
import 'page/setting.dart';
import 'page/store.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentTab = 0;
  final List<Widget> screen = [
    Library(),
    Store(),
    Account(),
    Setting(),
    Cart(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Library();
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
        onPressed: () {
          setState(() {
            currentScreen = Cart();
          });
        },
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
                        currentScreen = Library();
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
