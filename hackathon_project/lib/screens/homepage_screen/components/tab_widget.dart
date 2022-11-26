import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/get%20campaign%20list/get_campaign_list_response.dart';
import 'package:hackathon_project/screens/homepage_screen/components/event_card.dart';
import 'package:hackathon_project/utils/app_functions.dart';

import '../event_screen.dart';

class TabWidget extends StatefulWidget {
  final String title;
  final String decription;
  List<Data> campaignDataList = [];
  List<EventCard> _eventCard = [];

  TabWidget(
      this.title, this.decription, this.campaignDataList, this._eventCard);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
<<<<<<< Updated upstream
=======
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

          setState(() {
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
          });
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

>>>>>>> Stashed changes
  @override
  void initState() {
    getCampaign();
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
            Row(
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
