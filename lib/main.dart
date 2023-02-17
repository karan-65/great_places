import 'package:flutter/material.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/screens/add_places.dart';
import 'package:great_places/screens/places_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: greatplaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: placeslist(),
        debugShowCheckedModeBanner: false,
        routes: {
          addplace.routeName:(ctx)=>addplace(),
        },
      ),
    );
  }
}


