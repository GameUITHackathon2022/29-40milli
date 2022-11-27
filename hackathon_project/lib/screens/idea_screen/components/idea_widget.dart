import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IdeaWidget extends StatefulWidget {
  bool isFavorite;
  final String avtUrl;
  final String title;
  final String content;

  IdeaWidget({
    super.key,
    required this.avtUrl,
    required this.title,
    required this.content,
    required this.isFavorite,
  });

  @override
  State<IdeaWidget> createState() => _IdeaWidgetState();
}

class _IdeaWidgetState extends State<IdeaWidget> {
  void toggleFavouriteBtn() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                color: Color(0xffB3ABBC), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.avtUrl),
                      radius: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: toggleFavouriteBtn,
                      icon: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.isFavorite ? Colors.red : null,
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Color(0xff575FCC), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                child: Text(widget.content, style: TextStyle(color: Colors.white)) 
              ),
            ],
          ),
        ),
      ],
    );
  }
}
