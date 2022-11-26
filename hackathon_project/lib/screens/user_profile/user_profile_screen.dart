import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_project/API%20services/API%20models/profile/get_profile_request.dart';
import 'package:hackathon_project/API%20services/api_service.dart';
import 'package:hackathon_project/screens/user_profile/achievements_screen.dart';
import 'package:hackathon_project/screens/user_profile/liked_ideas_screen.dart';

class UserProfileScreen extends StatefulWidget {
  bool isAchievementScreen = true;
  String? _userName;
  String? _userAge;
  String? _userLocation;
  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    getProfile();
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {},
        ),
        title: Text("My Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User Name",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget._userName == null ? "Hieu Ngan" : widget._userName!,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Age",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(widget._userAge == null ? "18" : widget._userAge!),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(widget._userLocation == null
                      ? "Tp Ho Chi Minh"
                      : widget._userLocation!),
                ],
              ),
              SizedBox(
                width: 96,
                height: 96,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://picsum.photos/id/237/200/300",
                      height: 96,
                      width: 96 * 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: 50,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          DefaultTabController(
              length: 2,
              child: TabBar(
                onTap: (index) {
                  if (index == 0)
                    setState(() {
                      widget.isAchievementScreen = true;
                    });
                  else
                    setState(() {
                      widget.isAchievementScreen = false;
                    });
                },
                tabs: [
                  Text("Achievements"),
                  Text("Liked Ideas"),
                ],
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.black38,
                indicator: ContainerTabIndicator(
                  widthFraction: 0.5,
                  color: Theme.of(context).colorScheme.primary,
                  borderColor: Colors.black,
                  height: 8,
                  radius: BorderRadius.circular(5),
                  padding: const EdgeInsets.only(top: 22),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          widget.isAchievementScreen ? AchievementsScreen() : LikedIdeasScreen()
        ]),
      ),
    );
  }

  Future<void> getProfile() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create()
          .getProfile(GetProfileRequest("minh12345"))
          .then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          print(dataItem.data?.age);
          setState(() {
            widget._userAge = dataItem.data?.age.toString();
            widget._userLocation = dataItem.data?.location;
            widget._userName = dataItem.data?.name;
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
