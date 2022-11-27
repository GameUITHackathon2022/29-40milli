import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/idea_screen/components/button.dart';
import 'package:hackathon_project/screens/idea_screen/components/idea_widget.dart';
import 'package:hackathon_project/screens/idea_screen/new_idea_screen.dart';
import 'package:hackathon_project/screens/idea_screen/user_ideas_screen.dart';

class UserIdeasScreen extends StatelessWidget {
  UserIdeasScreen({super.key});
  var ideaList = [
    {
      'avtUrl': 'https://picsum.photos/id/237/200/300',
      "title": "Title",
      'content': "Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content ",
      'isFavorite': false,
    },
    {
      'avtUrl': 'https://picsum.photos/id/237/200/300',
      "title": "Title",
      'content': "Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content ",
      'isFavorite': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My idea"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: ListView.builder(
          itemCount: ideaList.length,
          itemBuilder: ((context, index) => Container(
                margin: EdgeInsets.all(15),
                child: IdeaWidget(
                    avtUrl: ideaList[index]["avtUrl"].toString(),
                    title: ideaList[index]["title"] as String,
                    content: ideaList[index]["content"] as String,
                    isFavorite: ideaList[index]["isFavorite"] as bool),
              ))),
    );
  }
}
