import 'package:flutter/material.dart';

class CampaignWidget extends StatefulWidget {
  String title;
  String description;
  CampaignWidget(this.title, this.description, {super.key});

  @override
  _CampaignWidget createState() => _CampaignWidget();
}

class _CampaignWidget extends State<CampaignWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
