import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_project/API%20services/API%20models/get%20campaign%20list/get_campaign_list_response.dart';
import '../../API services/api_service.dart';
import 'components/event_card.dart';
import 'components/search_bar.dart';
import 'components/tab_widget.dart';
import 'components/app_bar.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  _HomepageScreen createState() => _HomepageScreen();
}

class _HomepageScreen extends State<HomepageScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // app bar
              const SizedBox(height: 20),
              MyAppBar(),
              const SizedBox(height: 20),
              // text field
              SearchBar(),
              // text Around my location and widget
              const SizedBox(height: 20),
              TabWidget("Around my location", "Ho Chi Minh city",
                  Color(0xff61C5A0), campaignDataList, _eventCard),
              const SizedBox(height: 20),
              TabWidget("Campaigns", "Follow to see new campaigns",
                  Color(0xffFF6D3B), campaignDataList, _eventCard),
              SizedBox(height: 50),
              TabWidget("Challenges", "Follow to see new challenges",
                  Color(0xffFACD74), campaignDataList, _eventCard),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
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
              _eventCard.add(EventCard(
                campaignDataList[i],
                Color(0xff61C5A0),
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
}
