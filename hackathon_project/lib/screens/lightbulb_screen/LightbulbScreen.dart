import 'package:flutter/material.dart';

class LightbulbScreen extends StatefulWidget {
  const LightbulbScreen({super.key});

  @override
  _LightbulbScreen createState() => _LightbulbScreen();
}

class _LightbulbScreen extends State<LightbulbScreen> {
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
              'Lightbulb screen',
            ),
          ),
        ),
      ),
    );
  }
}
