import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final String title;
  final int time;
  final String imageuUrl;
  //final String host;
  final int numOfmenber;
  final String location;

  EventCard(
      this.title, this.time, this.numOfmenber, this.location, this.imageuUrl);

  TextStyle inFoTextstyle = TextStyle(
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(time);
    return Padding(
      padding: const EdgeInsets.only(right: 15),
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
                  imageuUrl,
                  fit: BoxFit.cover,
                ),
              ),
              // ten
              // thoi gian
              // nguoi to chuc
              // dia diem + so luong nguoi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: inFoTextstyle,
                    ),
                    Text(
                      DateFormat.yMMMd().format(date).toString(),
                      style: inFoTextstyle,
                    ),
                    // Text(
                    //   host,
                    //   style: inFoTextstyle,
                    // ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location,
                          style: inFoTextstyle,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, size: 20),
                            SizedBox(width: 5),
                            Text(
                              numOfmenber.toString(),
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
    );
  }
}
