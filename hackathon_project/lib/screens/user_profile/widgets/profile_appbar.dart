import 'package:flutter/material.dart';
import 'package:hackathon_project/screens/user_profile/edit_user_profile.dart';

import '../../../utils/app_functions.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "My profile",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                AppFunctions.pushToScreen(context, EditUserProfile());
              },
              icon: Icon(
                Icons.edit,
              ))
        ],
      ),
    );
  }
}
