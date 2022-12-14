import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IdeaLikedWidget extends StatefulWidget {
  bool isFavorite;
  final String avtUrl;
  final String title;
  final String content;

  IdeaLikedWidget({
    super.key,
    required this.avtUrl,
    required this.title,
    required this.content,
    required this.isFavorite,
  });

  @override
  State<IdeaLikedWidget> createState() => _IdeaWidgetState();
}

class _IdeaWidgetState extends State<IdeaLikedWidget> {
  void toggleFavouriteBtn() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                color: Color.fromARGB(255, 134, 133, 133), width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 134, 133, 133),
                offset: const Offset(
                  5.0,
                  5.0,
                ), //Offset
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.avtUrl),
                    radius: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: toggleFavouriteBtn,
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.content)
            ],
          ),
        ),
      ],
    );
  }
}
