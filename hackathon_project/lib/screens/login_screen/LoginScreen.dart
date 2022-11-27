import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/login/login_request.dart';
import 'package:hackathon_project/screens/main_screen/MainScreen.dart';
import 'package:hackathon_project/screens/register_screen/RegisterScreen.dart';

import '../../API services/API models/campaign/post_add_campaign_request.dart';
import '../../API services/api_service.dart';
import '../../utils/app_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x0),
          title: Center(
              child: Text(
            "Login",
            style: TextStyle(color: Color.fromRGBO(97, 197, 160, 1)),
          )),
          elevation: 0,
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    obscureText: false,
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                ScaleTap(
                  onPressed: () {
                    login(usernameController.text, passwordController.text);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(97, 197, 160, 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ScaleTap(
                  onPressed: () {
                    AppFunctions.pushToScreen(context, RegisterScreen());
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 2.0,
                            color: const Color.fromRGBO(97, 197, 160, 1))),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(97, 197, 160, 1)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> login(String? username, String? password) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    // showAlert(context);
    try {
      await ApiService.create()
          .postLogin(LoginRequest(username!, password!))
          .then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          AppFunctions.pushToScreenAndClear(context, MainScreen());
        } else {
          AppFunctions.showAlert(dataItem.message.toString(), context);
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
}
