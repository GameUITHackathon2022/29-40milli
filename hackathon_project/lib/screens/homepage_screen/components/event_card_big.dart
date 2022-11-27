import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../API services/API models/get campaign list/get_campaign_list_response.dart';

class EventCardBig extends StatelessWidget {
  final Data campaignData;
  final Color color;
  EventCardBig(this.campaignData, this.color);

  TextStyle titleTextstyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  TextStyle inFoTextstyle = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(campaignData.startTime as int);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 330,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Image.network(
                    "${campaignData.image}",
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
                        "${campaignData.title}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Participants: ${campaignData.followers?.length}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 20),
                              SizedBox(width: 5),
                              Text(
                                "${campaignData.location}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined, size: 20),
                              SizedBox(width: 5),
                              Text(
                                DateFormat.yMMMd().format(date).toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blueGrey),
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
