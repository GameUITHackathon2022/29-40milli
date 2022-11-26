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
  List<Data> campaignDataList1 = [];
  List<EventCard> _eventCard1 = [];
  List<Data> campaignDataList2 = [];
  List<EventCard> _eventCard2 = [];
  List<Data> campaignDataList3 = [];
  List<EventCard> _eventCard3 = [];

  @override
  void initState() {
    // TODO: implement initState
    getCampaign1();
    getCampaign2();
    getCampaign3();

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
              TabWidget(
                "Around my location",
                "Ho Chi Minh city",
                campaignDataList1,
                _eventCard1,
                Color(0xff61C5A0),
              ),
              const SizedBox(height: 20),
              TabWidget(
                "Campaigns",
                "Follow to see new campaigns",
                campaignDataList1,
                _eventCard2,
                Color(0xffFFA074),
              ),
              SizedBox(height: 50),
              TabWidget(
                "Challenges",
                "Follow to see new challenges",
                campaignDataList1,
                _eventCard3,
                Color(0xffFACD74),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getCampaign1() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getCampaignList().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          campaignDataList1 = dataItem.data!;
          setState(() {
            for (var i = 0; i < campaignDataList1.length; i++) {
              _eventCard1.add(EventCard(
                campaignDataList1[i],
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

  Future<void> getCampaign2() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getCampaignList().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          campaignDataList2 = dataItem.data!;
          setState(() {
            for (var i = 0; i < campaignDataList2.length; i++) {
              _eventCard2.add(EventCard(
                campaignDataList2[i],
                Color(0xffFFA074),
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

  Future<void> getCampaign3() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getCampaignList().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          campaignDataList3 = dataItem.data!;
          setState(() {
            for (var i = 0; i < campaignDataList3.length; i++) {
              _eventCard3.add(EventCard(
                campaignDataList3[i],
                Color(0xffFACD74),
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
