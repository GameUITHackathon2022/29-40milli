import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/api_service.dart';
import 'package:hackathon_project/screens/homepage_screen/components/event_card.dart';
import 'package:hackathon_project/screens/homepage_screen/components/tab_widget.dart';
import 'package:hackathon_project/screens/homepage_screen/event_screen.dart';
import 'package:hackathon_project/utils/app_functions.dart';

import '../../API services/API models/get campaign list/get_campaign_list_response.dart';

class CampaignsScreen extends StatefulWidget {
  const CampaignsScreen({super.key});

  @override
  State<CampaignsScreen> createState() => _CampaignsScreenState();
}

class _CampaignsScreenState extends State<CampaignsScreen> {
  List<Data> campaignDataList = [];
  List<EventCard> _eventCard = [];

  @override
  void initState() {
    // TODO: implement initState
    getCampaign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ScaleTap(
              onPressed: () {
                AppFunctions.pushToScreen(
                    context, EventScreen(campaignDataList[index]));
              },
              child: _eventCard[index]);
        },
        itemCount: _eventCard.length,
      ),
    );
    ;
  }

  Future<void> getCampaign() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getCampaignList().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          campaignDataList = dataItem.data!;
          //campaignDataList.clear();
          setState(() {
            for (var i = 0; i < campaignDataList.length; i++) {
              _eventCard.add(EventCard(campaignDataList[i], Color(0xff61C5A0)));
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
}
