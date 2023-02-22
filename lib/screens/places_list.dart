import 'package:flutter/material.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/screens/add_places.dart';
import 'package:provider/provider.dart';

//this is the main screen that we have
class placeslist extends StatelessWidget {
  const placeslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("your place"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(addplace.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<greatplaces>(
        child: Text("got no place start adding some"),
        builder: (ctx, greatplaces, ch) => greatplaces.items.length <= 0
            ? ch!
            : ListView.builder(
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatplaces.items[i].image),
                  ),
                  title: Text(greatplaces.items[i].title),
                ),
                itemCount: greatplaces.items.length,
              ),
      ),
    );
  }
}
