import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackathon_project/screens/user_profile/achievements_screen.dart';
import 'package:hackathon_project/screens/user_profile/campaigns_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("User profile"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    'https://picsum.photos/id/237/200/300',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        height: 30,
                        text: 'Campaigns',
                      ),
                      Tab(
                        height: 30,
                        text: 'Achievements',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CampaignsScreen(),
                  AchievementsScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
