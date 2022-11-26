import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../API services/API models/get campaign list/get_campaign_list_response.dart';

class EventScreen extends StatelessWidget {
  final Data campaignData;
  EventScreen(
    this.campaignData,
  );
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
                  SizedBox(height: 20),
                  Text(
                    campaignData.title as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person_outline, size: 30),
                          SizedBox(width: 10),
                          Text(
                            campaignData.followers!.length.toString(),
                            style: inFoTextstyle,
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 130,
                        child: ElevatedButton(
                          child: Text(
                            "ENROLL",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Location:  ",
                        style: titleTextstyle,
                      ),
                      Text(
                        (campaignData.location as String),
                        style: inFoTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Date and time:  ",
                        style: titleTextstyle,
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(date).toString(),
                        style: inFoTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Decription:  ",
                        style: titleTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.87,
                        child: Text(
                          campaignData.description as String,
                          textAlign: TextAlign.start,
                          style: inFoTextstyle,
                        ),
                      ),
                    ],
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
