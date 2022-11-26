import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigatorButton extends StatelessWidget {
  final text;
  final screen;
  NavigatorButton({super.key, required this.text, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: EdgeInsets.all(20),
          child: Center(child: Text(this.text)),
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
