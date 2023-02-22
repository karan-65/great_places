import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/widgets/image_imput.dart';
import 'package:provider/provider.dart';

//add place scrren that open while we tap on the add button
class addplace extends StatefulWidget {
  const addplace({Key? key}) : super(key: key);

  static const routeName = "/add-place";

  @override
  _addplaceState createState() => _addplaceState();
}

class _addplaceState extends State<addplace> {
  final _titlecontroller = TextEditingController();
  late File _pickedimage;

  void _selectimage(File pickedimage) {
    _pickedimage = pickedimage;
  }

  void _savePlace() {
    if (_titlecontroller.text.isEmpty || _pickedimage == null) {
      return;
     }
    Provider.of<greatplaces>(context, listen: false)
        .addplace(_titlecontroller.text, _pickedimage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add new place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "title"),
                      controller: _titlecontroller,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    imageinput(_selectimage),
                  ],
                ),
              ),
            ),
          ),
          Text("..user names"),
          ElevatedButton.icon(
            onPressed: _savePlace,
            label: Text("submit"),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
