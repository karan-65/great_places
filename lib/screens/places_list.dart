import 'package:flutter/material.dart';
import 'package:great_places/screens/add_places.dart';
//this is the main screen that we have
class placeslist extends StatelessWidget {
  const placeslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your place"),
        actions: <Widget>[IconButton(onPressed: () {
          Navigator.of(context).pushNamed(addplace.routeName);
        }, icon: Icon(Icons.add))],
      ),

    );
  }
}
