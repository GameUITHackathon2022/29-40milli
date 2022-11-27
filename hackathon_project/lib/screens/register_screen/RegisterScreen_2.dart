import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hackathon_project/API%20services/API%20models/create%20user/create_user_request.dart';
import 'package:hackathon_project/API%20services/API%20models/register/register_request.dart';
import 'package:hackathon_project/utils/app_functions.dart';

import '../../API services/api_service.dart';
import '../../core/useful_widget.dart';
import '../main_screen/MainScreen.dart';

class RegisterScreen_2 extends StatefulWidget {
  String username;
  String password;

  RegisterScreen_2(this.username, this.password, {super.key});

  @override
  _RegisterScreen_2 createState() => _RegisterScreen_2();
}

class _RegisterScreen_2 extends State<RegisterScreen_2> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  String location = "Hochiminh City";

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
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: AppDropdownInput<String>(
                    hintText: "Select location",
                    options: ["Hochiminh City", "Danang", "Hanoi"],
                    value: location,
                    onChanged: (String? newValue) {
                      setState(() {
                        location = newValue!;
                      });
                    },
                    getLabel: (String value) => value,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                ScaleTap(
                  onPressed: () {
                    if (nameController.text.length == 0 ||
                        ageController.text.length == 0) {
                      AppFunctions.showAlert(
                          "Please fill up all text-fields", context);
                    } else if (!nameRegExp.hasMatch(nameController.text)) {
                      AppFunctions.showAlert(
                          "Please enter valid name", context);
                    } else {
                      register(
                          widget.username,
                          widget.password,
                          nameController.text,
                          int.parse(ageController.text),
                          location,
                          null);
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
                      'Register',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> register(String? username, String? password, String? name,
      int? age, String? location, String? imageUrl) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      await ApiService.create()
          .postRegister(RegisterRequest(username, password))
          .then((dataItem) async {
        bool? success = dataItem.success;

        if (success == true) {
          await ApiService.create()
              .postCreateUser(CreateUserRequest(
                  widget.username, name, age, location, imageUrl))
              .then((dataItem) {
            bool? success = dataItem.success;
            if (success == true) {
              AppFunctions.pushToScreenAndClear(context, MainScreen());
              AppFunctions.showAlert(dataItem.message.toString(), context);
            } else {
              AppFunctions.showAlert(dataItem.message.toString(), context);
            }
          });
        } else {
          AppFunctions.showAlert(dataItem.message.toString(), context);
        }

      });
    } catch (obj) {
      print("${obj}");
      switch (obj.runtimeType) {
        case DioError:
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
