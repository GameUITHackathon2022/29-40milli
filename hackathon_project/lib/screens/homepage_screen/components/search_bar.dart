import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final findController = TextEditingController();
  String problem = "";

  String get getProblem {
    return problem;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: findController,
          //onSubmitted: (_) {},
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                problem = findController.text;
                findController.text = "";
                print(problem);
              },
              icon: Icon(Icons.search),
            ),
            border: InputBorder.none,
            hintText: 'How can we help you?',
          ),
        ),
      ),
    );
  }
}
