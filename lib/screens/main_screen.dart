import 'package:flutter/material.dart';
import 'package:myflutterapp/utility/constants.dart';

import 'gallery/screen.dart';
import 'place/screen.dart';
import 'profile/screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const double radiusBottomNav = 30;
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _pages = <Widget>[
    PlacePage(key: PageStorageKey('Page1')),
    GalleryPage(key: PageStorageKey('Page2')),
    ProfilePage(key: PageStorageKey('Page3')),
  ];

  static const List<String> titlebar = <String>["Place", "Gallery", "Profile"];

  final PageStorageBucket _bucket = PageStorageBucket();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          title: Text(
            titlebar[_selectedIndex],
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: bgColor,
        body: PageStorage(
          bucket: _bucket,
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(0x0DB5ABA4),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(radiusBottomNav),
                topLeft: Radius.circular(radiusBottomNav)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(radiusBottomNav),
              topLeft: Radius.circular(radiusBottomNav),
            ),
            child: BottomNavigationBar(
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance),
                  label: 'Place',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo_album),
                  label: 'Gallery',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              backgroundColor: bgColor,
              selectedItemColor: accentColor,
              unselectedItemColor: inactiveColor,
            ),
          ),
        ));
  }
}
