import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon_project/screens/user_profile/achievements_screen.dart';
import 'package:hackathon_project/screens/user_profile/campaigns_screen.dart';

class UserProfileScreen extends StatefulWidget {
  bool isAchievementScreen = false;
  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("User profile"),
          actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.edit))],
        ),
        body: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), //add border radius
                  child: Image.network(
                    "https://picsum.photos/id/237/200/300",
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Name",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Hieu Ngan",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("12"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("Ho Chi Minh City"),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isAchievementScreen = false;
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        // Change your radius here
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  child: Text("Campaigns"),
                )),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.isAchievementScreen = true;
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      child: Text("Achievements")),
                ),
              ],
            ),
            widget.isAchievementScreen
                ? AchievementsScreen()
                : CampaignsScreen()
          ],
        ),
      ),
    );
  }
}
