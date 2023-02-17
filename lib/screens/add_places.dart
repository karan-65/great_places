import 'package:flutter/material.dart';

//add place scrren that open while we tap on the add button
class addplace extends StatefulWidget {
  const addplace({Key? key}) : super(key: key);

  static const routeName = "/add-place";

  @override
  _addplaceState createState() => _addplaceState();
}

class _addplaceState extends State<addplace> {
  final _titlecontroller = TextEditingController();
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
                    )
                  ],
                ),
              ),
            ),
          ),
          Text("..user names"),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text("submit"),
            icon: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
