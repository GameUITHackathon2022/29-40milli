import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_project/API%20services/API%20models/idea/create_idea_request.dart';
import 'package:hackathon_project/API%20services/api_service.dart';
import 'package:hackathon_project/utils/app_functions.dart';

class NewIdeaScreen extends StatefulWidget {
  var _titleController = TextEditingController();
  var _desController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  NewIdeaScreen({super.key});

  @override
  State<NewIdeaScreen> createState() => _NewIdeaScreenState();
}

class _NewIdeaScreenState extends State<NewIdeaScreen> {
  Future<void> postIdea() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    // showAlert(context);
    try {
      await ApiService.create()
          .postIdea(CreateIdeaRequest("HN", "null",
              widget._titleController.text, widget._desController.text))
          .then((dataItem) {
        bool? success = dataItem.success;
        if (success == true) {
          AppFunctions.showAlert(dataItem.message.toString(), context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Text(
          "New Idea",
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Idea Title",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    maxLines: 2,
                    controller: widget._titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Brief Description"),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    maxLines: 4,
                    controller: widget._desController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState!.validate()) {
                        postIdea();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
        key: widget._formKey,
      ),
    );
  }
}
