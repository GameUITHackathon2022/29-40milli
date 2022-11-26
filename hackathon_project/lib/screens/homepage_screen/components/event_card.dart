import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/homepage_screen/event_screen.dart';
import 'package:intl/intl.dart';
import '../../../API services/API models/get campaign list/get_campaign_list_response.dart';

class EventCard extends StatelessWidget {
  final Data campaignData;
  EventCard(this.campaignData);
  TextStyle inFoTextstyle = TextStyle(
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(campaignData.startTime as int);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        // chuyen qua cai moi
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventScreen(this.campaignData),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 200,
            width: 270,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 270,
                  child: Image.network(
                    campaignData.image as String,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        campaignData.title as String,
                        style: inFoTextstyle,
                      ),
                      SizedBox(height: 5),
                      Text(
                        DateFormat.yMMMd().format(date).toString(),
                        //date.toString(),
                        style: inFoTextstyle,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            campaignData.location as String,
                            style: inFoTextstyle,
                          ),
                          Row(
                            children: [
                              Icon(Icons.person, size: 20),
                              SizedBox(width: 5),
                              Text(
                                campaignData.followers!.length.toString(),
                                style: inFoTextstyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
