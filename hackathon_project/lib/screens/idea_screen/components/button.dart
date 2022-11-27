import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigatorButton extends StatelessWidget {
  final text;
  final screen;
  final bgcolor;
  final assets;
  double w;
  NavigatorButton(
      {super.key,
      required this.text,
      required this.screen,
      required this.bgcolor,
      required this.assets,
      required this.w});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: SizedBox(
          height: 200,
          child: Container(
            decoration: BoxDecoration(
                color: Color(this.bgcolor),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.all(20),
            child: Center(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(image: AssetImage(this.assets), width: this.w),
                ),
                Text(this.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ]),
            ),
          ),
        ),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => this.screen),
          )
        },
      ),
    );
  }
}
