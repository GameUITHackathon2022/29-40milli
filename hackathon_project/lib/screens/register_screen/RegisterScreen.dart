import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/register/register_request.dart';
import 'package:hackathon_project/utils/app_functions.dart';

import '../../API services/api_service.dart';
import 'RegisterScreen_2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Register",
            style: TextStyle(color: Color.fromRGBO(97, 197, 160, 1)),
          ),
          centerTitle: true,
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
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    obscureText: true,
                    controller: retypePasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-enter password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                ScaleTap(
                  onPressed: () {
                    if (usernameController.text.length < 8 ||
                        passwordController.text.length < 8) {
                      AppFunctions.showAlert(
                          "Length of username and password must be > 8",
                          context);
                    } else if (passwordController.text !=
                        retypePasswordController.text) {
                      AppFunctions.showAlert(
                          "Please retype correct password", context);
                    } else {
                      AppFunctions.pushToScreen(
                          context,
                          RegisterScreen_2(usernameController.text,
                              passwordController.text));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(97, 197, 160, 1),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
