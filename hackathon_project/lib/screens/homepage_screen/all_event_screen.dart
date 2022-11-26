import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/utils/app_functions.dart';
import '../heart_screen/widgets/my_app_bar.dart';
import 'package:hackathon_project/API%20services/API%20models/get%20campaign%20list/get_campaign_list_response.dart';

import 'components/event_card_big.dart';
import 'event_screen.dart';

class AllEventScreen extends StatelessWidget {
  final String title;
  final Color color;
  List<Data> campaignDataList = [];
  //EventCardBig? _eventCardBig;
  AllEventScreen(this.title, this.campaignDataList, this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                MyAppBarCampain(title),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ScaleTap(
                      onPressed: () {
                        AppFunctions.pushToScreen(
                            context, EventScreen(campaignDataList[index]));
                      },
                      child: EventCardBig(
                        campaignDataList[index],
                        color,
                      ),
                    );
                  },
                  itemCount: campaignDataList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
