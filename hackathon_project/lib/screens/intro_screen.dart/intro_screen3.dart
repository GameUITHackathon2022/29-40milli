import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          SizedBox(
            height: 30,
            child: Image.asset("assets/images/eCamp.png"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 300,
              child: Image.asset("assets/images/anh3.jpg")),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: const Text(
              'Get Online Certificate',
              style: TextStyle(
                color: Color(0xff61C5A0),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: const Text(
              'Get online certificate by volunteering in social campaigns',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
