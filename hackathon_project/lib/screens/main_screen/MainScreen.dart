import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/account_screen/AccountScreen.dart';
import 'package:hackathon_project/screens/heart_screen/HeartScreen.dart';
import 'package:hackathon_project/screens/homepage_screen/HomepageScreen.dart';
import 'package:hackathon_project/screens/lightbulb_screen/LightbulbScreen.dart';

import '../idea_screen/idea_newsfeed_screen.dart';
import '../user_profile/user_profile_screen.dart';

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

  Widget iconDownLoad(IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      height: 30,
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: SafeArea(
        child: IndexedStack(
          children: <Widget>[
            HomepageScreen(),
            IdeaNewsfeedScreen(),
            HeartScreen(),
            UserProfileScreen(),
          ],
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          iconDownLoad(Icons.home),
          iconDownLoad(Icons.lightbulb),
          iconDownLoad(Icons.calendar_month),
          iconDownLoad(Icons.account_circle_outlined),
        ],
        color: Color(0xff61C5A0),
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 500),
        index: _selectedIndex,
        height: 60,
        onTap: _onItemTapped,
      ),
    );
  }
}
