import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "My profile",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
