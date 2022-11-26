import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/get%20campaign%20list/get_campaign_list_response.dart';
import 'package:hackathon_project/screens/homepage_screen/components/event_card.dart';
import 'package:hackathon_project/utils/app_functions.dart';

import '../event_screen.dart';

class TabWidget extends StatefulWidget {
  final String title;
  final String decription;
  final Color color;
  List<Data> campaignDataList = [];
  List<EventCard> _eventCard = [];

  TabWidget(
    this.title,
    this.decription,
    this.color,
    this.campaignDataList,
    this._eventCard,
  );

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // text and see all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.decription,
                        style: const TextStyle(
                          fontSize: 13,
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
                        color: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // cac event
            SizedBox(height: 25),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ScaleTap(
                      onPressed: () {
                        AppFunctions.pushToScreen(context,
                            EventScreen(widget.campaignDataList[index]));
                      },
                      child: widget._eventCard[index]);
                },
                itemCount: widget._eventCard.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
