import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/api_service.dart';
import 'package:hackathon_project/screens/idea_screen/components/button.dart';
import 'package:hackathon_project/screens/idea_screen/components/idea_widget.dart';
import 'package:hackathon_project/screens/idea_screen/new_idea_screen.dart';
import 'package:hackathon_project/screens/idea_screen/user_ideas_screen.dart';
import 'components/app_bar_1.dart';

import '../../API services/API models/idea/get_idea_response.dart';

class IdeaNewsfeedScreen extends StatefulWidget {
  IdeaNewsfeedScreen({super.key});

  @override
  State<IdeaNewsfeedScreen> createState() => _IdeaNewsfeedScreenState();
}

class _IdeaNewsfeedScreenState extends State<IdeaNewsfeedScreen> {
  List<Data> ideaList = [];
  String avtUrl = 'https://picsum.photos/id/237/200/300';

  Future<void> getIdea() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create().getIdeaList().then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          setState(() {
            ideaList = dataItem.data!;
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

  @override
  void initState() {
    getIdea();

    super.initState();
  }

  // var ideaList = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          MyAppBar1(),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                NavigatorButton(
                    text: "Add Idea",
                    screen: NewIdeaScreen(),
                    bgcolor: 0xffFABF48,
                    assets: 'assets/3dot.png',
                    w: 30),
                NavigatorButton(
                    text: "My Idea",
                    screen: UserIdeasScreen(),
                    bgcolor: 0xff739EF1,
                    assets: 'assets/lightbulb.png',
                    w: 30)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: ideaList.length,
                itemBuilder: ((context, index) => ScaleTap(
                      onPressed: () {},
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: IdeaWidget(
                            avtUrl: this.avtUrl,
                            title: ideaList[index].title as String,
                            content: ideaList[index].description as String,
                            isFavorite: false),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
