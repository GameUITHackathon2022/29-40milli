import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_project/API%20services/API%20models/login/login_request.dart';
import 'package:hackathon_project/screens/main_screen/MainScreen.dart';
import 'package:hackathon_project/screens/register_screen/RegisterScreen.dart';

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
          elevation: 0,
          toolbarHeight: 75,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                const Text(
                  "Login Screen",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    obscureText: false,
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
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
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: OutlinedButton(
                      onPressed: () {
                        login(usernameController.text, passwordController.text);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: Colors.blue),
                      ),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    AppFunctions.pushToScreen(context, RegisterScreen());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
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
}
