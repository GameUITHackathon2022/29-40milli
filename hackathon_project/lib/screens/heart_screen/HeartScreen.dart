import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/profile/get_profile_response.dart';
import 'package:hackathon_project/screens/heart_screen/widgets/event_applyed_card.dart';
import 'package:hackathon_project/screens/heart_screen/widgets/my_app_bar.dart';

import '../../API services/api_service.dart';
import '../../utils/app_functions.dart';
import '../homepage_screen/event_screen.dart';
import 'widgets/event_applyed_card copy.dart';

class HeartScreen extends StatefulWidget {
  const HeartScreen({super.key});

  @override
  _HeartScreen createState() => _HeartScreen();
}

class _HeartScreen extends State<HeartScreen> {
  List<EventApplyedCard_2> _eventApplyedCards = [];
  List<ParticipatedCampaign> _eventDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    // getCampaign();
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            MyAppBarCampain(),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ScaleTap(
                        onPressed: () {
                          // AppFunctions.pushToScreen(
                          //     context, EventScreen(_eventDataList[index]));
                        },
                        child: _eventApplyedCards[index]);
                  },
                  itemCount: _eventApplyedCards.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> getCampaign() async {
  //   EasyLoading.show(maskType: EasyLoadingMaskType.black);
  //   try {
  //     await ApiService.create().getCampaignList().then((dataItem) {
  //       bool? success = dataItem.success;
  //       if (success == true) {
  //         _eventDataList = dataItem.data!;
  //         //campaignDataList.clear();
  //         setState(() {
  //           for (var i = 0; i < _eventDataList.length; i++) {
  //             _eventApplyedCards.add(EventApplyedCard(_eventDataList[i]));
  //           }
  //         });
  //       }
  //     });
  //   } catch (obj) {
  //     print("${obj}");
  //     switch (obj.runtimeType) {
  //       case DioError:
  //         // Here's the sample to get the failed response error code and message
  //         final res = (obj as DioError).response;
  //         print(res!.statusCode);
  //         break;
  //       default:
  //     }
  //   } finally {
  //     EasyLoading.dismiss();
  //   }
  // }

  Future<void> getProfile() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getProfile().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          _eventDataList = dataItem.data!.participatedCampaign!;
          setState(() {
            for (var i = 0; i < _eventDataList.length; i++) {
              _eventApplyedCards.add(EventApplyedCard_2(_eventDataList[i]));
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
