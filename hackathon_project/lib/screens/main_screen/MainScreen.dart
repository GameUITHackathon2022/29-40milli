import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/account_screen/AccountScreen.dart';
import 'package:hackathon_project/screens/heart_screen/HeartScreen.dart';
import 'package:hackathon_project/screens/homepage_screen/HomepageScreen.dart';
import 'package:hackathon_project/screens/lightbulb_screen/LightbulbScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomepageScreen(),
    LightbulbScreen(),
    HeartScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, //selected item
        showUnselectedLabels: false, //unselected item
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'null',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'null',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'null',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'null',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
