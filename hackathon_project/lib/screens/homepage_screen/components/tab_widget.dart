import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_project/API%20services/API%20models/get%20campaign%20list/get_campaign_list_response.dart';
import 'package:hackathon_project/API%20services/api_service.dart';
import 'package:hackathon_project/screens/homepage_screen/components/event_card.dart';

class TabWidget extends StatefulWidget {
  final String title;
  final String decription;

  TabWidget(this.title, this.decription);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  // List<EventCard> _eventCard = [
  List<Data> campaignDataList = [];

  List<EventCard> _eventCard = [];

  Future<void> getCampaign() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getCampaignList().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          campaignDataList = dataItem.data!;
          for (var i = 0; i < campaignDataList.length; i++) {
            _eventCard.add(EventCard(
              campaignDataList[i].title as String,
              campaignDataList[i].startTime as int,
              //host,
              campaignDataList[i].followers!.length,
              campaignDataList[i].location as String,
              campaignDataList[i].image as String,
            ));
          }
        }
      });
    } catch (obj) {
      print("${obj}");
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print(res!.statusCode);
          break;
        default:
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getCampaign();
    });
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
                    widget.title,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.decription,
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
