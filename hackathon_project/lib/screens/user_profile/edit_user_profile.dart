import 'package:flutter/material.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final _form = GlobalKey<FormState>();
  final _nameUserFocusNode = FocusNode();
  final _ageUserFocusNode = FocusNode();
  final _locationUserFocusNode = FocusNode();
  final _urlUserFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  var _initValues = {
    'name': '',
    'userName': '',
    'age': '',
    'Location': '',
    'imageUrl': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            SizedBox(height: 10),
            TextFormField(
              initialValue: _initValues['name'],
              decoration: const InputDecoration(labelText: 'name'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_nameUserFocusNode);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide your name';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: _initValues['username'],
              focusNode: _nameUserFocusNode,
              decoration: const InputDecoration(labelText: 'user name'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_ageUserFocusNode);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide your username';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: _initValues['age'],
              keyboardType: TextInputType.number,
              focusNode: _ageUserFocusNode,
              decoration: const InputDecoration(labelText: 'age'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_locationUserFocusNode);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide your age';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: _initValues['Location'],
              focusNode: _locationUserFocusNode,
              decoration: const InputDecoration(labelText: 'location'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_urlUserFocusNode);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide your location';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: _imageUrlController.text.isEmpty
                      ? Text("Enter a URL")
                      : FittedBox(
                          child: Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Image URL'),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.url,
                    controller: _imageUrlController,
                    focusNode: _urlUserFocusNode,
                    onFieldSubmitted: (_) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an image URL.';
                      }
                      if (!value.startsWith('http') &&
                          !value.startsWith('https')) {
                        return 'Please enter a valid URL.';
                      }
                      if (!value.endsWith('.png') &&
                          !value.endsWith('.jpg') &&
                          !value.endsWith('.jpeg')) {
                        return 'Please enter a valid image URL.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
