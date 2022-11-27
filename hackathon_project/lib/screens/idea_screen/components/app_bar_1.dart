import 'package:flutter/material.dart';

class MyAppBar1 extends StatelessWidget {
  const MyAppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Text("Idea Donation", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Color(0xff190134), fontWeight: FontWeight.bold)),
      ),
    );
  }
}
