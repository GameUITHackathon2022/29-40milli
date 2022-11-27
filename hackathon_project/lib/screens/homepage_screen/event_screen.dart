import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hackathon_project/API%20services/API%20models/profile/get_profile_response.dart'
    show ParticipatedCampaign;
import 'package:intl/intl.dart';
import '../../../API services/API models/get campaign list/get_campaign_list_response.dart';
import '../../API services/API models/campaign/post_add_campaign_request.dart';
import '../../API services/API models/profile/get_profile_request.dart';
import '../../API services/api_service.dart';
import '../../utils/app_functions.dart';

class EventScreen extends StatefulWidget {
  final Data campaignData;
  EventScreen(
    this.campaignData,
  );

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<ParticipatedCampaign> _eventDataList = [];
  bool _check = false;

  TextStyle titleTextstyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle inFoTextstyle = TextStyle(
    fontSize: 18,
  );

  bool checkExit(String? id) {
    print(id);
    for (var i = 0; i < _eventDataList.length; i++) {
      if (_eventDataList[i].sId == id) print("aaaa");
    }
    return false;
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        widget.campaignData.startTime as int);
    if (checkExit(widget.campaignData.sId)) {
      _check = true;
      setState(() {});
    }
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
                      widget.campaignData.image as String,
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
                    widget.campaignData.title as String,
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
                            widget.campaignData.followers!.length.toString(),
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
                          onPressed: _check == false
                              ? () {
                                  addCampaign(
                                    "638236136d2971758705eb6f",
                                    widget.campaignData.sId,
                                  );
                                }
                              : null,
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
                        (widget.campaignData.location as String),
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
                          widget.campaignData.description as String,
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

  Future<void> addCampaign(String? userId, String? campaignId) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    // showAlert(context);
    try {
      await ApiService.create()
          .addCampaign(PostAddCampaignRequest(userId, campaignId))
          .then((dataItem) {
        AppFunctions.showAlert(dataItem.message.toString(), context);
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

  Future<void> getProfile() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create()
          .getProfile(GetProfileRequest("minh12345"))
          .then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          _eventDataList = dataItem.data!.participatedCampaign!;
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
