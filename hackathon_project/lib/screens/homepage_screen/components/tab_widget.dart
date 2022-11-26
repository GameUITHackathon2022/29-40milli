import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/homepage_screen/components/event_card.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final String decription;

  TabWidget(this.title, this.decription);

  List<EventCard> _eventCard = [
    EventCard(
      "Don rac bai bien",
      DateTime.now(),
      "UIT",
      5,
      "Ho Chi Minh",
      "assets/images/donrac.png",
    ),
    EventCard(
      "Don rac bai bien",
      DateTime.now(),
      "UIT",
      5,
      "Ho Chi Minh",
      "assets/images/bien.jpg",
    ),
    EventCard(
      "Don rac bai bien",
      DateTime.now(),
      "UIT",
      5,
      "Ho Chi Minh",
      "assets/images/bien.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          // text and see all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    decription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all >",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          // cac event
          SizedBox(height: 25),
          Container(
            height: 250,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _eventCard[index];
                },
                itemCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
