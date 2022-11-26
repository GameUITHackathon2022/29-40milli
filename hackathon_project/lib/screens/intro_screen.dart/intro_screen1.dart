import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

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
          SizedBox(height: MediaQuery.of(context).size.height * 0.13),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 300,
              child: Image.asset("assets/images/anh1.jpg")),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'Environmental Events',
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
              'Gather environmental events information hosted by trusted organizations',
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
