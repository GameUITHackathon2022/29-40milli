import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/api_service.dart';
import 'package:hackathon_project/screens/idea_screen/components/idea_widget.dart';
import 'package:hackathon_project/screens/user_profile/widgets/idea_liked_widget.dart';

import '../../API services/API models/idea/get_idea_response.dart';

class LikedIdeasScreen extends StatefulWidget {
  const LikedIdeasScreen({super.key});

  @override
  State<LikedIdeasScreen> createState() => _LikedIdeasScreenState();
}

class _LikedIdeasScreenState extends State<LikedIdeasScreen> {
  List<Data> ideaList = [];

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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: ideaList.length,
          itemBuilder: ((context, index) {
            if (index % 2 == 0)
              return ScaleTap(
                onPressed: () {},
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: IdeaLikedWidget(
                      avtUrl: ideaList[index].userImage.toString(),
                      title: ideaList[index].title as String,
                      content: ideaList[index].description as String,
                      isFavorite: false),
                ),
              );
            else
              return Container();
          })),
    );
  }
}
