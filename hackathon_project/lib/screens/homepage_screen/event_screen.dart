import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../API services/API models/get campaign list/get_campaign_list_response.dart';

class EventScreen extends StatelessWidget {
  final Data campaignData;
  EventScreen(
    this.campaignData,
  );
  TextStyle inFoTextstyle = TextStyle(
    fontSize: 18,
  );
  @override
  Widget build(BuildContext context) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(campaignData.startTime as int);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      campaignData.image as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black45),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  SizedBox(height: 10),
                  Text(
                    campaignData.title as String,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Date:  " + DateFormat.yMMMd().format(date).toString(),
                        style: inFoTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Location:  " + (campaignData.location as String),
                        style: inFoTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Num of member:  " +
                            campaignData.followers!.length.toString(),
                        style: inFoTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    campaignData.description as String,
                    style: inFoTextstyle,
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
