import 'package:flutter/material.dart';

class AppFunctions {
  static void showAlert(String message, BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        //elevates modal bottom screen
        elevation: 0,
        isDismissible: false,
        enableDrag: false,
        // gives rounded corner to modal bottom screen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          final double paddingWidth = 24;

          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: paddingWidth,
                      right: paddingWidth,
                      bottom: (MediaQuery.of(context).size.height - 225) / 2,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    // height: widgetSize.height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static void pushToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void pushToScreenAndClear(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => screen,
      ),
      (route) => false, //if you want to disable back feature set to false
    );
  }
}
