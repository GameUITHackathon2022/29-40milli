import 'package:flutter/material.dart';
import 'components/search_bar.dart';
import 'components/tab_widget.dart';
import 'components/app_bar.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  _HomepageScreen createState() => _HomepageScreen();
}

class _HomepageScreen extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // app bar
              const SizedBox(height: 20),
              MyAppBar(),
              const SizedBox(height: 20),
              // text field
              SearchBar(),
              // text Around my location and widget
              const SizedBox(height: 20),
              TabWidget("Around my location", "Ho Chi Minh city"),
              const SizedBox(height: 20),
              TabWidget("New event", "Follow to see new campaigns"),
            ],
          ),
        ),
      ),
    );
  }
}
