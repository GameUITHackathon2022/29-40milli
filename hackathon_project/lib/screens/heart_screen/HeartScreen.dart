import 'package:flutter/material.dart';

class HeartScreen extends StatefulWidget {
  const HeartScreen({super.key});

  @override
  _HeartScreen createState() => _HeartScreen();
}

class _HeartScreen extends State<HeartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              'Heart screen',
            ),
          ),
        ),
      ),
    );
  }
}
