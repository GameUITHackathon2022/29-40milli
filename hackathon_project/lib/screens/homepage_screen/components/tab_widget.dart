import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/get%20campaign%20list/get_campaign_list_response.dart';
import 'package:hackathon_project/screens/homepage_screen/all_event_screen.dart';
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
    this.campaignDataList,
    this._eventCard,
    this.color,
  );

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  void initState() {
    print("lengthhhhh: ${widget._eventCard.length}");
    super.initState();
  }

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
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.decription,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff575FCC),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      AppFunctions.pushToScreen(
                          context,
                          AllEventScreen(widget.title, widget.campaignDataList,
                              widget.color));
                    },
                    child: const Text(
                      "See all >",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // cac event
            SizedBox(height: 18),
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
