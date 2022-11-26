import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
                  "Register Screen",
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
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: OutlinedButton(
                      onPressed: () {
                        if (usernameController.text.length < 8 || passwordController.text.length < 8) {
                          AppFunctions.showAlert(
                              "Length of username and password must be > 8", context);
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
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: Colors.blue),
                      ),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      )),
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
