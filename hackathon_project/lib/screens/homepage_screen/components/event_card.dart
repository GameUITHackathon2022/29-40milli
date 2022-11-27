import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../API services/API models/get campaign list/get_campaign_list_response.dart';

class EventCard extends StatelessWidget {
  final Data campaignData;
  final Color color;
  EventCard(this.campaignData, this.color);

  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(campaignData.startTime as int);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 270,
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
                            fontSize: 16,
                            color: Color(0xff190134),
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                        DateFormat.yMMMd().format(date).toString(),
                        //date.toString(),
                        style: TextStyle(
                          color: Color(0xff190134),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${campaignData.location}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff190134)),
                          ),
                          Row(
                            children: [
                              Icon(Icons.person, size: 20),
                              SizedBox(width: 5),
                              Text(
                                "${campaignData.followers?.length}",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
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
